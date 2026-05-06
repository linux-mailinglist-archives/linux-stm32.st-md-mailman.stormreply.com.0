Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8K3SIErl+mmGTgMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 08:52:58 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1811C4D6D63
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 08:52:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C912C8F26F;
	Wed,  6 May 2026 06:52:57 +0000 (UTC)
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48C87C030CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2026 02:33:21 +0000 (UTC)
X-QQ-mid: esmtpsz16t1778034653t405f70b0
X-QQ-Originating-IP: 4meMtvNm/og9G0fVM/ycSpSa183Qcv1XH6iFoe6ZdSA=
Received: from [127.0.0.1] ( [116.234.74.217]) by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 06 May 2026 10:30:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2498618263695594642
Message-ID: <DD71CDEABC7C16D5+02d052ff-13bb-4712-a847-91416f76c578@radxa.com>
Date: Wed, 6 May 2026 10:30:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <20260501155421.3329862-11-elder@riscstar.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MxdW4jxL6NvXsbtSC0sdkRTYslY/wd+PTnnOEmueE64hCrFI+earuJRV
 hgNg2Ceej//UIQfd+2Wlk//epUITPXjjocchjWHEZMcdfNK1LLNLFyz0ZfXIRI3td8fvLcg
 ioV78ncJzF7+KQCzQK9t0u73IRt2vWCCO0ElFvy14O+nJcxgQpZdBKTQ9TxTIcZUoaAwD4Q
 xxzCEbjkDEoZxLTSeuiKoMKu+9qsf2zYfVwTd4hlpiDd5MHlm0CJzfCfSSoeI2FKWi3VgWo
 9CEexip17TssKCTg8w/buxu5ytVm0435turBile67gA71cUUxk7zTng8zNvMjJmNoMxOCli
 SSSo40gjI+GpvWoeF8JpMycBvTtnwXL8DvuC8k18EOcCQq+lv2FwbMqMBWph7sa7gSjdkCp
 O8jkqB5fGOO5vVNzg/eaRrs7biPOkQy44iN36TDJx0Wb03IkHOXbWxOab453acDV/JxVNOl
 uN9OScd0yczqaUxHJhVCBUC6AHGRz92UcT3bVSvvvD+L9qnUx3msHzghPxpppLzzOOcG0xw
 n79UGEvdQpwNrII1tgGEiLdYEYaUqmKTtnlD19HdD5uYy9GBUatNcBJtzhbCH9ijDsGrDTy
 sIre1iDEw9SwHlD/oFtCYBgrgyS6IHnf2+zt/3HEx1OgJOH5rlUg03KJ4BOL5bmDkOOdVtg
 hV3z89018f9IgXo2HO9E26kHWJoIdXlggavuQIQ/xNcS8GyZ973bAYpcbARpt/R5eHrlGKt
 yYmwp6EciINtFp7rAHahigqRc7OkhTAYteXoLX+w13hrYAAbpmbGo7nyIQh6eVXWksTovTp
 DNCclkxdoVXVsPuZuHvdsyeAiCuxOhLSqYwUXbeLg/0vNJMLPsFFK1MyzNaPPLIFuwuERmM
 W0BM4I5HB7dilQPZZyLzEFCaY2yOLQxcMxwiwF8R32kA1J4gqGyz16Qs8HzIVHG3H24Vu5H
 bSaoBbcHAZIxNn+BUYUmS+plXKCWKlZWHhqmJJh7mvJXe92jRy1l2J4fKNglrg3Cni9s=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-Mailman-Approved-At: Wed, 06 May 2026 06:52:55 +0000
Cc: me@ziyao.cc, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>, chenchuangyu@xiaomi.com,
 linux-stm32@st-md-mailman.stormreply.com, mohd.anwar@oss.qualcomm.com,
 weishangjuan@eswincomputing.com, daniel@iogearbox.net, chenhuacai@kernel.org,
 john.fastabend@gmail.com, siyanteng@cqsoftware.com.cn, sdf@fomichev.me,
 devicetree@vger.kernel.org, hawk@kernel.org, linux-arm-msm@vger.kernel.org,
 richardcochran@gmail.com, rohan.g.thomas@altera.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, livelycarpet87@gmail.com,
 ast@kernel.org, linux-gpio@vger.kernel.org, wens@kernel.org,
 linux-arm-kernel@lists.infradead.org, inochiama@gmail.com,
 a0987203069@gmail.com, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, bpf@vger.kernel.org, julianbraha@gmail.com,
 matthew.gerlach@altera.com, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 10/12] net: stmmac: tc956x: add
 TC956x/QPS615 support
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
X-Rspamd-Queue-Id: 1811C4D6D63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORGED_MUA_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:elder@riscstar.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:maxime.chevallier@bootlin.com,m:rmk+kernel@armlinux.org.uk,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:me@ziyao.cc,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:linux-stm32@st-md-mailman.stormreply.com,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:devicetree@vger.kernel.org,m:hawk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:ast@kernel.org,m:linux-gpio@vger.kernel.org,m:wens@kernel.org,m:li
 nux-arm-kernel@lists.infradead.org,m:inochiama@gmail.com,m:a0987203069@gmail.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:bpf@vger.kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:hkallweit1@gmail.com,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:conor@kernel.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[sophon@radxa.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[ziyao.cc,vger.kernel.org,riscstar.com,xiaomi.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,iogearbox.net,kernel.org,gmail.com,cqsoftware.com.cn,fomichev.me,altera.com,bp.renesas.com,lists.infradead.org];
	NEURAL_HAM(-0.00)[-0.997];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[radxa.com:mid,radxa.com:email,riscstar.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]

On 5/1/2026 11:54 PM, Alex Elder wrote:
> From: Daniel Thompson <daniel@riscstar.com>
> 
> Toshiba TC956x is an Ethernet AVB/TSN bridge and is essentially a
> small and highly-specialized SoC. TC956x includes an "eMAC" subsystem
> that can be accessed, along with several other peripherals, via two
> PCIe endpoint functions. There is a main driver for the endpoint that
> decomposes things and creates auxiliary bus devices to model the SoC.
> 
> The eMAC consists of a Designware XGMAC, XPCS and PMA. Each eMAC is
> supported by an MSIGEN that bridges TC956x level interrupts to PCIe
> MSIs.
> 
> Add a driver for the eMAC/MSIGEN combination.
> 
> Co-developed-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> ---
>   drivers/net/ethernet/stmicro/stmmac/Kconfig   |  13 +
>   drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +
>   .../ethernet/stmicro/stmmac/dwmac-tc956x.c    | 791 ++++++++++++++++++
>   include/soc/toshiba/tc956x-dwmac.h            |  84 ++
>   4 files changed, 890 insertions(+)
>   create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
>   create mode 100644 include/soc/toshiba/tc956x-dwmac.h
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> index e3dd5adda5aca..66bcfaccbe21f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -404,6 +404,19 @@ config DWMAC_MOTORCOMM
>   	  This enables glue driver for Motorcomm DWMAC-based PCI Ethernet
>   	  controllers. Currently only YT6801 is supported.
>   
> +config DWMAC_TC956X
> +	tristate "Toshiba TC956X DWMAC support"
> +	depends on PCI
> +	depends on COMMON_CLK
> +	depends on TOSHIBA_TC956X_PCI
> +	default m if TOSHIBA_TC956X_PCI

Hi Alex,

I think GENERIC_IRQ_CHIP should be selected here.

Thank you for the driver.

-- 
Best regards,
Xilin Wu <sophon@radxa.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
