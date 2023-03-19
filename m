Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA52A6C0B73
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 08:38:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78764C6A619;
	Mon, 20 Mar 2023 07:38:16 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA5E9C035BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Mar 2023 21:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1679261773; x=1710797773;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TT1NZFDlglG04lWn8b3D569FNDwhCTSHE8VYkA5Dx+U=;
 b=WKaw6rUcTOeE0inMQGlGtGmjp90fl1MKnXSlhwcjR0uTGv+TSfQhtBa/
 ZMeE/SOs7mAU/+x+nfH12GRsDyLRysJnb0vOfO+9cvKvKuPJW/2zvHA28
 Sg8JaGedLN9FT5HabLBc3IieCaIo5Sc3SOovuXfCBD8eB0AH+J3SG40WI
 Os22/7bPuhJf/RQWxpqUZ8Ukw7a1OSGnpb3n7JpaWoD0RakHEn7m7soF6
 Sp0Z+04qjbMikYEWaanrODa1EZgsJbAsqzMPDsaa2vigs+AYGRLDcgdWX
 EfQj+s6kqNfySgY4kcptgGwZic/TeIt4r9nw0an682A9bys6uzncrYGqp g==;
X-IronPort-AV: E=Sophos;i="5.98,274,1673884800"; d="scan'208";a="225789107"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2023 05:36:10 +0800
IronPort-SDR: rv0anT3xCUKSeyeVoaW6VZAP1LREVyQcVs5dSNQv5HdgT5Ca64aOMzEIKSl/o5CINaSi29yEd+
 ytt6Rj/7OYI8Iw0f2fKWwzi3X37stSl5x6mKvXi4YX2SM0d1dr+m7Fk4irgXS2fTyvALoZ6sX1
 D8CNc2lv6USNPh7+laS7GzNt4Sz9plNm7upDjuUbobR6QLvj6Ew4YuK4g+L2eA/gm4l4RZbqKR
 pBkCfIneGReLC3KClSiI92wlYTfe7gFyAJ7ehykhLIMmJYOuoCkHjvicnrXeVDBowto+C7Lr1Q
 72k=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Mar 2023 13:52:31 -0700
IronPort-SDR: fwdOO3lUVTL5XMb6SESWkPuCHxu5F7qeH8aWYY/IEQTBAR4ykn34Fko/7SPwxys3NJ76vgD+PL
 3G1PmqiSdQN0Owu/vGi5z+nWBQ/Nuc9Z1pt4TRagdi38XcTJJyw65+7i+lV+n9GBZttF9EdI6K
 vXS6xrWa5Pz4u7pgvbA+6MQJUJtihQkfqFQ/q3jJqt0Onl/XDHvRnmarUp85t+efh5Da1ebrWM
 l9QeTabTHIkcOiJAARtL76v04cG5htgj1HCECuwk/xhcXwMs6MBpTwNb8HhrlMCz/vRhIOhSX7
 1RI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Mar 2023 14:36:10 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PfrlY5v89z1RtVq
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Mar 2023 14:36:09 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:content-language:references:to
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1679261769; x=1681853770; bh=TT1NZFDlglG04lWn8b3D569FNDwhCTSHE8V
 YkA5Dx+U=; b=QceyF5oNgACqQ8sjsaRsiMOKfIYhjptv+fXpR24cGwPjyZhDE1j
 vVmgqZawW8MFo5w81UX/N52F6h67agOJDFUyUb26MzgcphLhiinAiqQWkieTDSKP
 tMMgaECZYxLp1AAz1MMQPIQxuB1u4yb+076EfiIzRPeTuVAU47AJHX2rsw0FD0M6
 aN6IbHH5zNoOnkdty9lS8MRF7fH9wn7leP6VHgCRIEPD0Lu8nhsE0QYDYh6J7RuV
 YATURhDOEJMHT68V1LyWGaCM/XqNoNFWnDzd7tMvIHoW1lRA0mU47aUJRZFpCT9y
 Rk7jzcAnxN6RDazWX8w6IClCd740fySdtZQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id X9mReij-9qa3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Mar 2023 14:36:09 -0700 (PDT)
Received: from [10.225.163.91] (unknown [10.225.163.91])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PfrlK1xCLz1RtVm;
 Sun, 19 Mar 2023 14:35:57 -0700 (PDT)
Message-ID: <de10b014-1a97-e74a-c7c4-b1004bf4cb60@opensource.wdc.com>
Date: Mon, 20 Mar 2023 06:35:55 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Rob Herring <robh@kernel.org>, =?UTF-8?Q?Andreas_F=c3=a4rber?=
 <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>,
 Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Michal Simek <michal.simek@xilinx.com>
References: <20230317233623.3968172-1-robh@kernel.org>
Content-Language: en-US
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20230317233623.3968172-1-robh@kernel.org>
X-Mailman-Approved-At: Mon, 20 Mar 2023 07:38:15 +0000
X-Topics: 
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-rockchip@lists.infradead.org, patches@opensource.cirrus.com,
 openbmc@lists.ozlabs.org, linux-actions@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, asahi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: pinctrl: Drop unneeded quotes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 3/18/23 08:36, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
