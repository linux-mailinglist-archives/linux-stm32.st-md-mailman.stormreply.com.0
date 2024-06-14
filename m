Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FC4908A59
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 12:43:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B4CFC6B460;
	Fri, 14 Jun 2024 10:43:16 +0000 (UTC)
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com
 [91.218.175.185])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15E45C69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 10:43:09 +0000 (UTC)
X-Envelope-To: 0x1207@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1718361788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SgrqTw+/It1adEehXLmXgK1moXKsGq11xoueSFrMzIE=;
 b=rHe5tIyFpYY8WnnvPWz/uRNkvY1NX0ZvYBVNgMPpFZoqBS5Er8gvmcjyMkxpNGymbke3VK
 rrSwU18WcSDFZhwwFjaNC1iU8syEFiPYTXUIA8KVMF6O3Zz8/R6xbj2f3LDVicpL2eid9F
 rBqWnk88DXauX70HneT4jxMDHcG/uF0=
X-Envelope-To: linux@armlinux.org.uk
X-Envelope-To: davem@davemloft.net
X-Envelope-To: alexandre.torgue@foss.st.com
X-Envelope-To: joabreu@synopsys.com
X-Envelope-To: edumazet@google.com
X-Envelope-To: kuba@kernel.org
X-Envelope-To: pabeni@redhat.com
X-Envelope-To: mcoquelin.stm32@gmail.com
X-Envelope-To: jpinto@synopsys.com
X-Envelope-To: vinschen@redhat.com
X-Envelope-To: netdev@vger.kernel.org
X-Envelope-To: linux-stm32@st-md-mailman.stormreply.com
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: xfr@outlook.com
X-Envelope-To: rock.xu@nio.com
Message-ID: <0474a247-e5f2-4a7f-879b-c764591a5f28@linux.dev>
Date: Fri, 14 Jun 2024 11:43:00 +0100
MIME-Version: 1.0
To: Furong Xu <0x1207@gmail.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Joao Pinto
 <jpinto@synopsys.com>, Corinna Vinschen <vinschen@redhat.com>
References: <20240614060349.498414-1-0x1207@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20240614060349.498414-1-0x1207@gmail.com>
X-Migadu-Flow: FLOW_OUT
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, rock.xu@nio.com,
 xfr@outlook.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: stmmac: Enable TSO on
	VLANs
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

On 14/06/2024 07:03, Furong Xu wrote:
> The TSO engine works well when the frames are not VLAN Tagged.
> But it will produce broken segments when frames are VLAN Tagged.
> 
> The first segment is all good, while the second segment to the
> last segment are broken, they lack of required VLAN tag.
> 
> An example here:
> ========
> // 1st segment of a VLAN Tagged TSO frame, nothing wrong.
> MacSrc > MacDst, ethertype 802.1Q (0x8100), length 1518: vlan 100, p 1, ethertype IPv4 (0x0800), HostA:42643 > HostB:5201: Flags [.], seq 1:1449
> 
> // 2nd to last segments of a VLAN Tagged TSO frame, VLAN tag is missing.
> MacSrc > MacDst, ethertype IPv4 (0x0800), length 1514: HostA:42643 > HostB:5201: Flags [.], seq 1449:2897
> MacSrc > MacDst, ethertype IPv4 (0x0800), length 1514: HostA:42643 > HostB:5201: Flags [.], seq 2897:4345
> MacSrc > MacDst, ethertype IPv4 (0x0800), length 1514: HostA:42643 > HostB:5201: Flags [.], seq 4345:5793
> MacSrc > MacDst, ethertype IPv4 (0x0800), length 1514: HostA:42643 > HostB:5201: Flags [P.], seq 5793:7241
> 
> // normal VLAN Tagged non-TSO frame, nothing wrong.
> MacSrc > MacDst, ethertype 802.1Q (0x8100), length 1022: vlan 100, p 1, ethertype IPv4 (0x0800), HostA:42643 > HostB:5201: Flags [P.], seq 7241:8193
> MacSrc > MacDst, ethertype 802.1Q (0x8100), length 70: vlan 100, p 1, ethertype IPv4 (0x0800), HostA:42643 > HostB:5201: Flags [F.], seq 8193
> ========
> 
> When transmitting VLAN Tagged TSO frames, never insert VLAN tag by HW,
> always insert VLAN tag to SKB payload, then TSO works well on VLANs for
> all MAC cores.
> 
> Tested on DWMAC CORE 5.10a, DWMAC CORE 5.20a and DWXGMAC CORE 3.20a
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
>    Changes in v2:
>      - Use __vlan_hwaccel_push_inside() to insert vlan tag to the payload.
> ---
>   .../net/ethernet/stmicro/stmmac/stmmac_main.c | 27 ++++++++++---------
>   1 file changed, 14 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index bbedf2a8c60f..e8cbfada63ca 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4233,18 +4233,27 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
>   {
>   	struct dma_desc *desc, *first, *mss_desc = NULL;
>   	struct stmmac_priv *priv = netdev_priv(dev);
> -	int nfrags = skb_shinfo(skb)->nr_frags;
> -	u32 queue = skb_get_queue_mapping(skb);
>   	unsigned int first_entry, tx_packets;
>   	struct stmmac_txq_stats *txq_stats;
> -	int tmp_pay_len = 0, first_tx;
> +	int tmp_pay_len = 0, first_tx, nfrags;
>   	struct stmmac_tx_queue *tx_q;
> -	bool has_vlan, set_ic;
> +	bool set_ic;
>   	u8 proto_hdr_len, hdr;
> -	u32 pay_len, mss;
> +	u32 pay_len, mss, queue;
>   	dma_addr_t des;
>   	int i;
>   

As there will be another iteration, could you please re-arrange
variables to keep reverse x-mas tree order?


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
