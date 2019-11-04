Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C37D9EDF93
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2019 13:03:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76C09C36B0B;
	Mon,  4 Nov 2019 12:03:44 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E8D1C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Nov 2019 12:03:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id D406F28021A
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Adrian Ratiu
 <adrian.ratiu@collabora.com>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org
In-Reply-To: <974be8e9-fcb4-4457-8831-40b2fa834ae2@baylibre.com>
References: <20191031142633.12460-1-adrian.ratiu@collabora.com>
 <20191031142633.12460-2-adrian.ratiu@collabora.com>
 <974be8e9-fcb4-4457-8831-40b2fa834ae2@baylibre.com>
Date: Mon, 04 Nov 2019 14:03:56 +0200
Message-ID: <87v9rz97bn.fsf@collabora.com>
MIME-Version: 1.0
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [Linux-stm32] [PATCH 1/4] drm: bridge: dw_mipi_dsi: access
 registers via a regmap
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Mon, 04 Nov 2019, Neil Armstrong <narmstrong@baylibre.com> 
wrote:
> On 31/10/2019 15:26, Adrian Ratiu wrote: 
>> Convert the common bridge code and the two rockchip & stm 
>> drivers which currently use it to the regmap API in 
>> anticipation for further changes to make it more generic and 
>> add older DSI host controller support as found on i.mx6 based 
>> devices.   No functional changes other than requiring the 
>> platform drivers to provide a regmap via their plat_data. Going 
>> further each platform driver can also add its own regmap 
>> configuration like for maximum write offsets, r/w callbacks or 
>> different register layouts.   Suggested-by: Boris Brezillon 
>> <boris.brezillon@collabora.com> Signed-off-by: Adrian Ratiu 
>> <adrian.ratiu@collabora.com> --- 
>>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 189 
>>  +++++++++--------- .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c 
>>  |  36 +++- drivers/gpu/drm/stm/dw_mipi_dsi-stm.c         |  44 
>>  ++-- include/drm/bridge/dw_mipi_dsi.h              |   2 +- 4 
>>  files changed, 155 insertions(+), 116 deletions(-) 
>>  diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c 
>> b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c index 
>> b6e793bb653c..4ef3e9038cc2 100644 --- 
>> a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c +++ 
>> b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c @@ -15,6 +15,7 
>> @@ 
>>  #include <linux/module.h> #include <linux/of_device.h> 
>>  #include <linux/pm_runtime.h> 
>> +#include <linux/regmap.h> 
>>  #include <linux/reset.h>  #include <video/mipi_display.h> 
>> @@ -226,7 +227,7 @@ struct dw_mipi_dsi { 
>>  	struct mipi_dsi_host dsi_host; struct drm_bridge 
>>  *panel_bridge; struct device *dev; 
>> -	void __iomem *base; +	struct regmap *regs; 
>>   struct clk *pclk;  
>> @@ -280,16 +281,6 @@ static inline struct dw_mipi_dsi 
>> *bridge_to_dsi(struct drm_bridge *bridge) 
>>  	return container_of(bridge, struct dw_mipi_dsi, bridge); }  
>> -static inline void dsi_write(struct dw_mipi_dsi *dsi, u32 reg, 
>> u32 val) -{ -	writel(val, dsi->base + reg); -} - -static 
>> inline u32 dsi_read(struct dw_mipi_dsi *dsi, u32 reg) -{ - 
>> return readl(dsi->base + reg); -} - 
>>  static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host, 
>>  struct mipi_dsi_device *device) { 
>> @@ -366,29 +357,29 @@ static void dw_mipi_message_config(struct 
>> dw_mipi_dsi *dsi, 
>>  	if (lpm) val |= CMD_MODE_ALL_LP;  
>> -	dsi_write(dsi, DSI_LPCLK_CTRL, lpm ? 0 : 
>> PHY_TXREQUESTCLKHS); -	dsi_write(dsi, DSI_CMD_MODE_CFG, 
>> val); +	regmap_write(dsi->regs, DSI_LPCLK_CTRL, lpm ? 0 : 
>> PHY_TXREQUESTCLKHS); +	regmap_write(dsi->regs, 
>> DSI_CMD_MODE_CFG, val); 
>>  }  static int dw_mipi_dsi_gen_pkt_hdr_write(struct dw_mipi_dsi 
>>  *dsi, u32 hdr_val) { int ret; 
>> -	u32 val, mask; +	u32 val = 0, mask; 
>>   
>> -	ret = readl_poll_timeout(dsi->base + DSI_CMD_PKT_STATUS, - 
>> val, !(val & GEN_CMD_FULL), 1000, - 
>> CMD_PKT_STATUS_TIMEOUT_US); +	ret = 
>> regmap_read_poll_timeout(dsi->regs, DSI_CMD_PKT_STATUS, + 
>> val, !(val & GEN_CMD_FULL), 1000, + 
>> CMD_PKT_STATUS_TIMEOUT_US); 
>>  	if (ret) { dev_err(dsi->dev, "failed to get available 
>>  command FIFO\n"); return ret; }  
>> -	dsi_write(dsi, DSI_GEN_HDR, hdr_val); + 
>> regmap_write(dsi->regs, DSI_GEN_HDR, hdr_val); 
>>   mask = GEN_CMD_EMPTY | GEN_PLD_W_EMPTY; 
>> -	ret = readl_poll_timeout(dsi->base + DSI_CMD_PKT_STATUS, - 
>> val, (val & mask) == mask, -				 1000, 
>> CMD_PKT_STATUS_TIMEOUT_US); +	ret = 
>> regmap_read_poll_timeout(dsi->regs, DSI_CMD_PKT_STATUS, + 
>> val, (val & mask) == mask, + 
>> 1000, CMD_PKT_STATUS_TIMEOUT_US); 
>>  	if (ret) { dev_err(dsi->dev, "failed to write command 
>>  FIFO\n"); return ret; 
>> @@ -403,24 +394,26 @@ static int dw_mipi_dsi_write(struct 
>> dw_mipi_dsi *dsi, 
>>  	const u8 *tx_buf = packet->payload; int len = 
>>  packet->payload_length, pld_data_bytes = sizeof(u32), ret; 
>>  __le32 word; 
>> -	u32 val; +	u32 val = 0; 
>>   while (len) { if (len < pld_data_bytes) { word = 0; 
>>  memcpy(&word, tx_buf, len); 
>> -			dsi_write(dsi, DSI_GEN_PLD_DATA, 
>> le32_to_cpu(word)); + 
>> regmap_write(dsi->regs, DSI_GEN_PLD_DATA, + 
>> le32_to_cpu(word)); 
>>  			len = 0; } else { memcpy(&word, tx_buf, 
>>  pld_data_bytes); 
>> -			dsi_write(dsi, DSI_GEN_PLD_DATA, 
>> le32_to_cpu(word)); + 
>> regmap_write(dsi->regs, DSI_GEN_PLD_DATA, + 
>> le32_to_cpu(word)); 
>>  			tx_buf += pld_data_bytes; len -= 
>>  pld_data_bytes; }  
>> -		ret = readl_poll_timeout(dsi->base + 
>> DSI_CMD_PKT_STATUS, - 
>> val, !(val & GEN_PLD_W_FULL), 1000, - 
>> CMD_PKT_STATUS_TIMEOUT_US); +		ret = 
>> regmap_read_poll_timeout(dsi->regs, DSI_CMD_PKT_STATUS, + 
>> val, !(val & GEN_PLD_W_FULL), + 
>> 1000, CMD_PKT_STATUS_TIMEOUT_US); 
>>  		if (ret) { dev_err(dsi->dev, "failed to get 
>>  available write payload FIFO\n"); 
>> @@ -438,12 +431,12 @@ static int dw_mipi_dsi_read(struct 
>> dw_mipi_dsi *dsi, 
>>  { int i, j, ret, len = msg->rx_len; u8 *buf = msg->rx_buf; 
>> -	u32 val; +	u32 val = 0; 
>>   /* Wait end of the read operation */ 
>> -	ret = readl_poll_timeout(dsi->base + DSI_CMD_PKT_STATUS, - 
>> val, !(val & GEN_RD_CMD_BUSY), - 
>> 1000, CMD_PKT_STATUS_TIMEOUT_US); +	ret = 
>> regmap_read_poll_timeout(dsi->regs, DSI_CMD_PKT_STATUS, + 
>> val, !(val & GEN_RD_CMD_BUSY), + 
>> 1000, CMD_PKT_STATUS_TIMEOUT_US); 
>>  	if (ret) { dev_err(dsi->dev, "Timeout during read 
>>  operation\n"); return ret; 
>> @@ -451,15 +444,15 @@ static int dw_mipi_dsi_read(struct 
>> dw_mipi_dsi *dsi, 
>>   for (i = 0; i < len; i += 4) { /* Read fifo must not be empty 
>>  before all bytes are read */ 
>> -		ret = readl_poll_timeout(dsi->base + 
>> DSI_CMD_PKT_STATUS, - 
>> val, !(val & GEN_PLD_R_EMPTY), - 
>> 1000, CMD_PKT_STATUS_TIMEOUT_US); +		ret = 
>> regmap_read_poll_timeout(dsi->regs, DSI_CMD_PKT_STATUS, + 
>> val, !(val & GEN_PLD_R_EMPTY), + 
>> 1000, CMD_PKT_STATUS_TIMEOUT_US); 
>>  		if (ret) { dev_err(dsi->dev, "Read payload FIFO is 
>>  empty\n"); return ret; }  
>> -		val = dsi_read(dsi, DSI_GEN_PLD_DATA); + 
>> regmap_read(dsi->regs, DSI_GEN_PLD_DATA, &val); 
>>  		for (j = 0; j < 4 && j + i < len; j++) buf[i + j] 
>>  = val >> (8 * j); } 
>> @@ -536,29 +529,29 @@ static void 
>> dw_mipi_dsi_video_mode_config(struct dw_mipi_dsi *dsi) 
>>  	} #endif /* CONFIG_DEBUG_FS */  
>> -	dsi_write(dsi, DSI_VID_MODE_CFG, val); + 
>> regmap_write(dsi->regs, DSI_VID_MODE_CFG, val); 
>>  }  static void dw_mipi_dsi_set_mode(struct dw_mipi_dsi *dsi, 
>>  unsigned long mode_flags) { 
>> -	dsi_write(dsi, DSI_PWR_UP, RESET); + 
>> regmap_write(dsi->regs, DSI_PWR_UP, RESET); 
>>   if (mode_flags & MIPI_DSI_MODE_VIDEO) { 
>> -		dsi_write(dsi, DSI_MODE_CFG, ENABLE_VIDEO_MODE); + 
>> regmap_write(dsi->regs, DSI_MODE_CFG, ENABLE_VIDEO_MODE); 
>>  		dw_mipi_dsi_video_mode_config(dsi); 
>> -		dsi_write(dsi, DSI_LPCLK_CTRL, 
>> PHY_TXREQUESTCLKHS); +		regmap_write(dsi->regs, 
>> DSI_LPCLK_CTRL, PHY_TXREQUESTCLKHS); 
>>  	} else { 
>> -		dsi_write(dsi, DSI_MODE_CFG, ENABLE_CMD_MODE); + 
>> regmap_write(dsi->regs, DSI_MODE_CFG, ENABLE_CMD_MODE); 
>>  	}  
>> -	dsi_write(dsi, DSI_PWR_UP, POWERUP); + 
>> regmap_write(dsi->regs, DSI_PWR_UP, POWERUP); 
>>  }  static void dw_mipi_dsi_disable(struct dw_mipi_dsi *dsi) { 
>> -	dsi_write(dsi, DSI_PWR_UP, RESET); -	dsi_write(dsi, 
>> DSI_PHY_RSTZ, PHY_RSTZ); +	regmap_write(dsi->regs, 
>> DSI_PWR_UP, RESET); +	regmap_write(dsi->regs, 
>> DSI_PHY_RSTZ, PHY_RSTZ); 
>>  }  static void dw_mipi_dsi_init(struct dw_mipi_dsi *dsi) 
>> @@ -573,14 +566,14 @@ static void dw_mipi_dsi_init(struct 
>> dw_mipi_dsi *dsi) 
>>  	 */ u32 esc_clk_division = (dsi->lane_mbps >> 3) / 20 + 1;  
>> -	dsi_write(dsi, DSI_PWR_UP, RESET); + 
>> regmap_write(dsi->regs, DSI_PWR_UP, RESET); 
>>   /* * TODO dw drv improvements * timeout clock division should 
>>  be computed with the * high speed transmission counter timeout 
>>  and byte lane...  */ 
>> -	dsi_write(dsi, DSI_CLKMGR_CFG, TO_CLK_DIVISION(10) | + 
>> regmap_write(dsi->regs, DSI_CLKMGR_CFG, TO_CLK_DIVISION(10) | 
>>  		  TX_ESC_CLK_DIVISION(esc_clk_division)); }  
>> @@ -609,22 +602,22 @@ static void dw_mipi_dsi_dpi_config(struct 
>> dw_mipi_dsi *dsi, 
>>  	if (mode->flags & DRM_MODE_FLAG_NHSYNC) val |= 
>>  HSYNC_ACTIVE_LOW;  
>> -	dsi_write(dsi, DSI_DPI_VCID, DPI_VCID(dsi->channel)); - 
>> dsi_write(dsi, DSI_DPI_COLOR_CODING, color); - 
>> dsi_write(dsi, DSI_DPI_CFG_POL, val); + 
>> regmap_write(dsi->regs, DSI_DPI_VCID, DPI_VCID(dsi->channel)); 
>> +	regmap_write(dsi->regs, DSI_DPI_COLOR_CODING, color); + 
>> regmap_write(dsi->regs, DSI_DPI_CFG_POL, val); 
>>  	/* * TODO dw drv improvements * largest packet sizes 
>>  during hfp or during vsa/vpb/vfp * should be computed 
>>  according to byte lane, lane number and only * if sending lp 
>>  cmds in high speed is enable (PHY_TXREQUESTCLKHS) */ 
>> -	dsi_write(dsi, DSI_DPI_LP_CMD_TIM, OUTVACT_LPCMD_TIME(4) + 
>> regmap_write(dsi->regs, DSI_DPI_LP_CMD_TIM, 
>> OUTVACT_LPCMD_TIME(4) 
>>  		  | INVACT_LPCMD_TIME(4)); }  static void 
>>  dw_mipi_dsi_packet_handler_config(struct dw_mipi_dsi *dsi) { 
>> -	dsi_write(dsi, DSI_PCKHDL_CFG, CRC_RX_EN | ECC_RX_EN | 
>> BTA_EN); +	regmap_write(dsi->regs, DSI_PCKHDL_CFG, CRC_RX_EN 
>> | ECC_RX_EN | BTA_EN); 
>>  }  static void dw_mipi_dsi_video_packet_config(struct 
>>  dw_mipi_dsi *dsi, 
>> @@ -638,7 +631,7 @@ static void 
>> dw_mipi_dsi_video_packet_config(struct dw_mipi_dsi *dsi, 
>>  	 * non-burst video modes, see 
>>  dw_mipi_dsi_video_mode_config()...  */  
>> -	dsi_write(dsi, DSI_VID_PKT_SIZE, + 
>> regmap_write(dsi->regs, DSI_VID_PKT_SIZE, 
>>  		       dw_mipi_is_dual_mode(dsi) ? 
>>  VID_PKT_SIZE(mode->hdisplay / 2) : 
>>  VID_PKT_SIZE(mode->hdisplay)); 
>> @@ -651,14 +644,15 @@ static void 
>> dw_mipi_dsi_command_mode_config(struct dw_mipi_dsi *dsi) 
>>  	 * compute high speed transmission counter timeout 
>>  according * to the timeout clock division (TO_CLK_DIVISION) 
>>  and byte lane...  */ 
>> -	dsi_write(dsi, DSI_TO_CNT_CFG, HSTX_TO_CNT(1000) | 
>> LPRX_TO_CNT(1000)); +	regmap_write(dsi->regs, 
>> DSI_TO_CNT_CFG, +		     HSTX_TO_CNT(1000) | 
>> LPRX_TO_CNT(1000)); 
>>  	/* * TODO dw drv improvements * the Bus-Turn-Around 
>>  Timeout Counter should be computed * according to byte lane... 
>>  */ 
>> -	dsi_write(dsi, DSI_BTA_TO_CNT, 0xd00); - 
>> dsi_write(dsi, DSI_MODE_CFG, ENABLE_CMD_MODE); + 
>> regmap_write(dsi->regs, DSI_BTA_TO_CNT, 0xd00); + 
>> regmap_write(dsi->regs, DSI_MODE_CFG, ENABLE_CMD_MODE); 
>>  }  /* Get lane byte clock cycles. */ 
>> @@ -692,13 +686,13 @@ static void 
>> dw_mipi_dsi_line_timer_config(struct dw_mipi_dsi *dsi, 
>>  	 * computations below may be improved...  */ lbcc = 
>>  dw_mipi_dsi_get_hcomponent_lbcc(dsi, mode, htotal); 
>> -	dsi_write(dsi, DSI_VID_HLINE_TIME, lbcc); + 
>> regmap_write(dsi->regs, DSI_VID_HLINE_TIME, lbcc); 
>>   lbcc = dw_mipi_dsi_get_hcomponent_lbcc(dsi, mode, hsa); 
>> -	dsi_write(dsi, DSI_VID_HSA_TIME, lbcc); + 
>> regmap_write(dsi->regs, DSI_VID_HSA_TIME, lbcc); 
>>   lbcc = dw_mipi_dsi_get_hcomponent_lbcc(dsi, mode, hbp); 
>> -	dsi_write(dsi, DSI_VID_HBP_TIME, lbcc); + 
>> regmap_write(dsi->regs, DSI_VID_HBP_TIME, lbcc); 
>>  }  static void dw_mipi_dsi_vertical_timing_config(struct 
>>  dw_mipi_dsi *dsi, 
>> @@ -711,10 +705,10 @@ static void 
>> dw_mipi_dsi_vertical_timing_config(struct dw_mipi_dsi *dsi, 
>>  	vfp = mode->vsync_start - mode->vdisplay; vbp = 
>>  mode->vtotal - mode->vsync_end;  
>> -	dsi_write(dsi, DSI_VID_VACTIVE_LINES, vactive); - 
>> dsi_write(dsi, DSI_VID_VSA_LINES, vsa); -	dsi_write(dsi, 
>> DSI_VID_VFP_LINES, vfp); -	dsi_write(dsi, DSI_VID_VBP_LINES, 
>> vbp); +	regmap_write(dsi->regs, DSI_VID_VACTIVE_LINES, 
>> vactive); +	regmap_write(dsi->regs, DSI_VID_VSA_LINES, vsa); + 
>> regmap_write(dsi->regs, DSI_VID_VFP_LINES, vfp); + 
>> regmap_write(dsi->regs, DSI_VID_VBP_LINES, vbp); 
>>  }  static void dw_mipi_dsi_dphy_timing_config(struct 
>>  dw_mipi_dsi *dsi) 
>> @@ -729,19 +723,24 @@ static void 
>> dw_mipi_dsi_dphy_timing_config(struct dw_mipi_dsi *dsi) 
>>  	 * DSI_CMD_MODE_CFG.MAX_RD_PKT_SIZE_LP (see 
>>  CMD_MODE_ALL_LP) */  
>> -	hw_version = dsi_read(dsi, DSI_VERSION) & VERSION; + 
>> regmap_read(dsi->regs, DSI_VERSION, &hw_version); +	hw_version 
>> &= VERSION; 
>>   if (hw_version >= HWVER_131) { 
>> -		dsi_write(dsi, DSI_PHY_TMR_CFG, 
>> PHY_HS2LP_TIME_V131(0x40) | - 
>> PHY_LP2HS_TIME_V131(0x40)); -		dsi_write(dsi, 
>> DSI_PHY_TMR_RD_CFG, MAX_RD_TIME_V131(10000)); + 
>> regmap_write(dsi->regs, DSI_PHY_TMR_CFG, + 
>> PHY_HS2LP_TIME_V131(0x40) | + 
>> PHY_LP2HS_TIME_V131(0x40)); + 
>> regmap_write(dsi->regs, DSI_PHY_TMR_RD_CFG, + 
>> MAX_RD_TIME_V131(10000)); 
>>  	} else { 
>> -		dsi_write(dsi, DSI_PHY_TMR_CFG, 
>> PHY_HS2LP_TIME(0x40) | - 
>> PHY_LP2HS_TIME(0x40) | MAX_RD_TIME(10000)); + 
>> regmap_write(dsi->regs, DSI_PHY_TMR_CFG, + 
>> PHY_HS2LP_TIME(0x40) | + 
>> PHY_LP2HS_TIME(0x40) | + 
>> MAX_RD_TIME(10000)); 
>>  	}  
>> -	dsi_write(dsi, DSI_PHY_TMR_LPCLK_CFG, 
>> PHY_CLKHS2LP_TIME(0x40) -		  | 
>> PHY_CLKLP2HS_TIME(0x40)); +	regmap_write(dsi->regs, 
>> DSI_PHY_TMR_LPCLK_CFG, + 
>> PHY_CLKHS2LP_TIME(0x40) | PHY_CLKLP2HS_TIME(0x40)); 
>>  }  static void dw_mipi_dsi_dphy_interface_config(struct 
>>  dw_mipi_dsi *dsi) 
>> @@ -751,46 +750,49 @@ static void 
>> dw_mipi_dsi_dphy_interface_config(struct dw_mipi_dsi *dsi) 
>>  	 * stop wait time should be the maximum between host dsi * 
>>  and panel stop wait times */ 
>> -	dsi_write(dsi, DSI_PHY_IF_CFG, PHY_STOP_WAIT_TIME(0x20) | 
>> -		  N_LANES(dsi->lanes)); + 
>> regmap_write(dsi->regs, DSI_PHY_IF_CFG, + 
>> PHY_STOP_WAIT_TIME(0x20) | N_LANES(dsi->lanes)); 
>>  }  static void dw_mipi_dsi_dphy_init(struct dw_mipi_dsi *dsi) 
>>  { /* Clear PHY state */ 
>> -	dsi_write(dsi, DSI_PHY_RSTZ, PHY_DISFORCEPLL | 
>> PHY_DISABLECLK -		  | PHY_RSTZ | PHY_SHUTDOWNZ); - 
>> dsi_write(dsi, DSI_PHY_TST_CTRL0, PHY_UNTESTCLR); - 
>> dsi_write(dsi, DSI_PHY_TST_CTRL0, PHY_TESTCLR); - 
>> dsi_write(dsi, DSI_PHY_TST_CTRL0, PHY_UNTESTCLR); + 
>> regmap_write(dsi->regs, DSI_PHY_RSTZ, PHY_DISFORCEPLL | 
>> PHY_DISABLECLK +		     | PHY_RSTZ | PHY_SHUTDOWNZ); 
>> +	regmap_write(dsi->regs, DSI_PHY_TST_CTRL0, PHY_UNTESTCLR); 
>> +	regmap_write(dsi->regs, DSI_PHY_TST_CTRL0, PHY_TESTCLR); + 
>> regmap_write(dsi->regs, DSI_PHY_TST_CTRL0, PHY_UNTESTCLR); 
>>  }  static void dw_mipi_dsi_dphy_enable(struct dw_mipi_dsi 
>>  *dsi) { 
>> -	u32 val; +	u32 val = 0; 
>>  	int ret;  
>> -	dsi_write(dsi, DSI_PHY_RSTZ, PHY_ENFORCEPLL | 
>> PHY_ENABLECLK | -		  PHY_UNRSTZ | PHY_UNSHUTDOWNZ); + 
>> regmap_write(dsi->regs, DSI_PHY_RSTZ, PHY_ENFORCEPLL | 
>> PHY_ENABLECLK | +		     PHY_UNRSTZ | 
>> PHY_UNSHUTDOWNZ); 
>>   
>> -	ret = readl_poll_timeout(dsi->base + DSI_PHY_STATUS, val, 
>> -				 val & PHY_LOCK, 1000, 
>> PHY_STATUS_TIMEOUT_US); +	ret = 
>> regmap_read_poll_timeout(dsi->regs, DSI_PHY_STATUS, + 
>> val, val & PHY_LOCK, + 
>> 1000, PHY_STATUS_TIMEOUT_US); 
>>  	if (ret) DRM_DEBUG_DRIVER("failed to wait phy lock 
>>  state\n");  
>> -	ret = readl_poll_timeout(dsi->base + DSI_PHY_STATUS, - 
>> val, val & PHY_STOP_STATE_CLK_LANE, 1000, - 
>> PHY_STATUS_TIMEOUT_US); +	ret = 
>> regmap_read_poll_timeout(dsi->regs, DSI_PHY_STATUS, + 
>> val, val & PHY_STOP_STATE_CLK_LANE, 1000, + 
>> PHY_STATUS_TIMEOUT_US); 
>>  	if (ret) DRM_DEBUG_DRIVER("failed to wait phy clk lane 
>>  stop state\n"); }  static void dw_mipi_dsi_clear_err(struct 
>>  dw_mipi_dsi *dsi) { 
>> -	dsi_read(dsi, DSI_INT_ST0); -	dsi_read(dsi, 
>> DSI_INT_ST1); -	dsi_write(dsi, DSI_INT_MSK0, 0); - 
>> dsi_write(dsi, DSI_INT_MSK1, 0); +	u32 val; + + 
>> regmap_read(dsi->regs, DSI_INT_ST0, &val); + 
>> regmap_read(dsi->regs, DSI_INT_ST1, &val); + 
>> regmap_write(dsi->regs, DSI_INT_MSK0, 0); + 
>> regmap_write(dsi->regs, DSI_INT_MSK1, 0); 
>>  }  static void dw_mipi_dsi_bridge_post_disable(struct 
>>  drm_bridge *bridge) 
>> @@ -996,13 +998,10 @@ __dw_mipi_dsi_probe(struct 
>> platform_device *pdev, 
>>  		return ERR_PTR(-ENODEV); }  
>> -	if (!plat_data->base) { -		dsi->base = 
>> devm_platform_ioremap_resource(pdev, 0); -		if 
>> (IS_ERR(dsi->base)) -			return 
>> ERR_PTR(-ENODEV); - -	} else { -		dsi->base 
>> = plat_data->base; +	dsi->regs = plat_data->regs; +	if 
>> (!dsi->regs) { +		DRM_ERROR("DSI regmap not supplied 
>> by platform driver\n"); +		return ERR_PTR(-ENODEV); 
>>  	}  dsi->pclk = devm_clk_get(dev, "pclk"); 
>> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c 
>> b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c index 
>> bc073ec5c183..3c33ed1fa805 100644 --- 
>> a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c +++ 
>> b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c @@ -24,6 
>> +24,8 @@ 
>>  #include "rockchip_drm_drv.h" #include "rockchip_drm_vop.h"  
>> +#define DRIVER_NAME "dw-mipi-dsi-rockchip" + 
>>  #define DSI_PHY_RSTZ			0xa0 #define 
>>  PHY_DISFORCEPLL			0 #define PHY_ENFORCEPLL 
>>  BIT(3) 
>> @@ -212,7 +214,7 @@ struct rockchip_dw_dsi_chip_data { 
>>  struct dw_mipi_dsi_rockchip { struct device *dev; struct 
>>  drm_encoder encoder; 
>> -	void __iomem *base; +	struct regmap *regs; 
>>   struct regmap *grf_regmap; struct clk *pllref_clk; 
>> @@ -297,12 +299,15 @@ static int max_mbps_to_parameter(unsigned 
>> int max_mbps) 
>>   static inline void dsi_write(struct dw_mipi_dsi_rockchip 
>>  *dsi, u32 reg, u32 val) { 
>> -	writel(val, dsi->base + reg); +	regmap_write(dsi->regs, 
>> reg, val); 
>>  }  static inline u32 dsi_read(struct dw_mipi_dsi_rockchip 
>>  *dsi, u32 reg) { 
>> -	return readl(dsi->base + reg); +	u32 val; + + 
>> regmap_read(dsi->regs, reg, &val); +	return val; 
>>  }  static inline void dsi_set(struct dw_mipi_dsi_rockchip 
>>  *dsi, u32 reg, u32 mask) 
>> @@ -884,6 +889,13 @@ static const struct dw_mipi_dsi_host_ops 
>> dw_mipi_dsi_rockchip_host_ops = { 
>>  	.detach = dw_mipi_dsi_rockchip_host_detach, };  
>> +static const struct regmap_config rockchip_dsi_regmap_config = 
>> { +	.reg_bits = 32, +	.val_bits = 32, + 
>> .reg_stride = 4, +	.name = DRIVER_NAME, +}; + 
>>  static int dw_mipi_dsi_rockchip_probe(struct platform_device 
>>  *pdev) { struct device *dev = &pdev->dev; 
>> @@ -892,6 +904,7 @@ static int 
>> dw_mipi_dsi_rockchip_probe(struct platform_device *pdev) 
>>  	struct resource *res; const struct 
>>  rockchip_dw_dsi_chip_data *cdata = 
>>  of_device_get_match_data(dev); 
>> +	void __iomem *regs; 
>>  	int ret, i;  dsi = devm_kzalloc(dev, sizeof(*dsi), 
>>  GFP_KERNEL); 
>> @@ -899,10 +912,17 @@ static int 
>> dw_mipi_dsi_rockchip_probe(struct platform_device *pdev) 
>>  		return -ENOMEM;  res = platform_get_resource(pdev, 
>>  IORESOURCE_MEM, 0); 
>> -	dsi->base = devm_ioremap_resource(dev, res); -	if 
>> (IS_ERR(dsi->base)) { +	regs = devm_ioremap_resource(dev, 
>> res); +	if (IS_ERR(regs)) { 
>>  		DRM_DEV_ERROR(dev, "Unable to get dsi 
>>  registers\n"); 
>> -		return PTR_ERR(dsi->base); +		return 
>> PTR_ERR(regs); +	} + +	dsi->regs = 
>> devm_regmap_init_mmio(dev, regs, + 
>> &rockchip_dsi_regmap_config); +	if (IS_ERR(dsi->regs)) { + 
>> DRM_DEV_ERROR(dev, "Unable to create DSI regmap\n"); + 
>> return PTR_ERR(dsi->regs); 
>>  	}  i = 0; 
>> @@ -954,7 +974,7 @@ static int 
>> dw_mipi_dsi_rockchip_probe(struct platform_device *pdev) 
>>  	}  dsi->dev = dev; 
>> -	dsi->pdata.base = dsi->base; +	dsi->pdata.regs = 
>> dsi->regs; 
>>  	dsi->pdata.max_data_lanes = dsi->cdata->max_data_lanes; 
>>  dsi->pdata.phy_ops = &dw_mipi_dsi_rockchip_phy_ops; 
>>  dsi->pdata.host_ops = &dw_mipi_dsi_rockchip_host_ops; 
>> @@ -1072,6 +1092,6 @@ struct platform_driver 
>> dw_mipi_dsi_rockchip_driver = { 
>>  	.remove		= dw_mipi_dsi_rockchip_remove, .driver 
>>  = { .of_match_table = dw_mipi_dsi_rockchip_dt_ids, 
>> -		.name	= "dw-mipi-dsi-rockchip", + 
>> .name	= DRIVER_NAME, 
>>  	}, }; 
>> diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c 
>> b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c index 
>> 514efefb0016..cc233271347b 100644 --- 
>> a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c +++ 
>> b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c @@ -12,6 +12,7 @@ 
>>  #include <linux/module.h> #include <linux/platform_device.h> 
>>  #include <linux/regulator/consumer.h> 
>> +#include <linux/regmap.h> 
>>   #include <video/mipi_display.h>  
>> @@ -19,6 +20,8 @@ 
>>  #include <drm/drm_mipi_dsi.h> #include <drm/drm_print.h>  
>> +#define DRIVER_NAME "stm32-display-dsi" + 
>>  #define HWVER_130			0x31333000	/* IP 
>>  version 1.30 */ #define HWVER_131			0x31333100 
>>  /* IP version 1.31 */  
>> @@ -75,7 +78,7 @@ enum dsi_color { 
>>  #define TIMEOUT_US	200000  struct dw_mipi_dsi_stm { 
>> -	void __iomem *base; +	struct regmap *regs; 
>>  	struct clk *pllref_clk; struct dw_mipi_dsi *dsi; u32 
>>  hw_version; 
>> @@ -86,12 +89,15 @@ struct dw_mipi_dsi_stm { 
>>   static inline void dsi_write(struct dw_mipi_dsi_stm *dsi, u32 
>>  reg, u32 val) { 
>> -	writel(val, dsi->base + reg); +	regmap_write(dsi->regs, 
>> reg, val); 
>>  }  static inline u32 dsi_read(struct dw_mipi_dsi_stm *dsi, u32 
>>  reg) { 
>> -	return readl(dsi->base + reg); +	u32 val; + + 
>> regmap_read(dsi->regs, reg, &val); +	return val; 
>>  }  static inline void dsi_set(struct dw_mipi_dsi_stm *dsi, u32 
>>  reg, u32 mask) 
>> @@ -202,15 +208,15 @@ static int dw_mipi_dsi_phy_init(void 
>> *priv_data) 
>>   /* Enable the regulator */ dsi_set(dsi, DSI_WRPCR, 
>>  WRPCR_REGEN | WRPCR_BGREN); 
>> -	ret = readl_poll_timeout(dsi->base + DSI_WISR, val, val & 
>> WISR_RRS, -				 SLEEP_US, TIMEOUT_US); + 
>> ret = regmap_read_poll_timeout(dsi->regs, DSI_WISR, val, val & 
>> WISR_RRS, +				       SLEEP_US, 
>> TIMEOUT_US); 
>>  	if (ret) DRM_DEBUG_DRIVER("!TIMEOUT! waiting REGU, let's 
>>  continue\n");  /* Enable the DSI PLL & wait for its lock */ 
>>  dsi_set(dsi, DSI_WRPCR, WRPCR_PLLEN); 
>> -	ret = readl_poll_timeout(dsi->base + DSI_WISR, val, val & 
>> WISR_PLLLS, -				 SLEEP_US, 
>> TIMEOUT_US); +	ret = regmap_read_poll_timeout(dsi->regs, 
>> DSI_WISR, val, +				       val & 
>> WISR_PLLLS, SLEEP_US, TIMEOUT_US); 
>>  	if (ret) DRM_DEBUG_DRIVER("!TIMEOUT! waiting PLL, let's 
>>  continue\n");  
>> @@ -327,12 +333,20 @@ static const struct of_device_id 
>> dw_mipi_dsi_stm_dt_ids[] = { 
>>  }; MODULE_DEVICE_TABLE(of, dw_mipi_dsi_stm_dt_ids);  
>> +static const struct regmap_config stm_dsi_regmap_config = { + 
>> .reg_bits = 32, +	.val_bits = 32, +	.reg_stride = 4, + 
>> .name = DRIVER_NAME, +}; + 
>>  static int dw_mipi_dsi_stm_probe(struct platform_device *pdev) 
>>  { struct device *dev = &pdev->dev; struct dw_mipi_dsi_stm 
>>  *dsi; struct clk *pclk; struct resource *res; 
>> +	void __iomem *regs; 
>>  	int ret;  dsi = devm_kzalloc(dev, sizeof(*dsi), 
>>  GFP_KERNEL); 
>> @@ -340,13 +354,19 @@ static int dw_mipi_dsi_stm_probe(struct 
>> platform_device *pdev) 
>>  		return -ENOMEM;  res = platform_get_resource(pdev, 
>>  IORESOURCE_MEM, 0); 
>> -	dsi->base = devm_ioremap_resource(dev, res); -	if 
>> (IS_ERR(dsi->base)) { -		ret = PTR_ERR(dsi->base); 
>> +	regs = devm_ioremap_resource(dev, res); +	if 
>> (IS_ERR(regs)) { +		ret = PTR_ERR(regs); 
>>  		DRM_ERROR("Unable to get dsi registers %d\n", 
>>  ret); return ret; }  
>> +	dsi->regs = devm_regmap_init_mmio(dev, regs, 
>> &stm_dsi_regmap_config); +	if (IS_ERR(dsi->regs)) { + 
>> DRM_DEV_ERROR(dev, "Unable to create DSI regmap\n"); + 
>> return PTR_ERR(dsi->regs); +	} + 
>>  	dsi->vdd_supply = devm_regulator_get(dev, "phy-dsi"); if 
>>  (IS_ERR(dsi->vdd_supply)) { ret = PTR_ERR(dsi->vdd_supply); 
>> @@ -396,7 +416,7 @@ static int dw_mipi_dsi_stm_probe(struct 
>> platform_device *pdev) 
>>  		goto err_dsi_probe; }  
>> -	dw_mipi_dsi_stm_plat_data.base = dsi->base; + 
>> dw_mipi_dsi_stm_plat_data.regs = dsi->regs; 
>>  	dw_mipi_dsi_stm_plat_data.priv_data = dsi; 
>>  platform_set_drvdata(pdev, dsi); 
>> @@ -474,7 +494,7 @@ static struct platform_driver 
>> dw_mipi_dsi_stm_driver = { 
>>  	.remove		= dw_mipi_dsi_stm_remove, .driver 
>>  = { .of_match_table = dw_mipi_dsi_stm_dt_ids, 
>> -		.name	= "stm32-display-dsi", + 
>> .name	= DRIVER_NAME, 
>>  		.pm = &dw_mipi_dsi_stm_pm_ops, }, }; 
>> diff --git a/include/drm/bridge/dw_mipi_dsi.h 
>> b/include/drm/bridge/dw_mipi_dsi.h index 
>> 94cc64a342e1..ecc1897efa62 100644 --- 
>> a/include/drm/bridge/dw_mipi_dsi.h +++ 
>> b/include/drm/bridge/dw_mipi_dsi.h @@ -37,7 +37,7 @@ struct 
>> dw_mipi_dsi_host_ops { 
>>  };  struct dw_mipi_dsi_plat_data { 
>> -	void __iomem *base; +	struct regmap *regs; 
>>  	unsigned int max_data_lanes;  enum drm_mode_status 
>>  (*mode_valid)(void *priv_data, 
>>  
> 
> OK for the dw-mipi-dsi changes, but why should the 
> dw_mipi_dsi-stm be changed aswell ? 
> 
> AFAIK these are independent.

I don't understand how they are independent. Isn't the stm driver 
also using the same dw-mipi-dsi bridge as rockchip and now imx 
since it was first added in commit
c1c026dbc183 ("drm/stm: Add STM32 DSI controller driver") ?

I don't have the hardware to test the stm driver on a live boot, 
but compilation certainly fails if I don't modify it :)

>
> Neil
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
