Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3380131F71
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2020 06:46:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F0A0C36B0B;
	Tue,  7 Jan 2020 05:46:49 +0000 (UTC)
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18A8FC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2020 05:46:48 +0000 (UTC)
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200107054644epoutp02ad4d3aea79f8264e197e60b2a47b111f~nhJ0S7syI2768927689epoutp02O
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2020 05:46:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200107054644epoutp02ad4d3aea79f8264e197e60b2a47b111f~nhJ0S7syI2768927689epoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578376004;
 bh=rpOmXMQDMiEUV6h4gsMF/DhyY6RdP2+VJxeu30CnrSU=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=NYuOjV05+wf5uc24waEK6SjkWgJrIidj9N4iI6mu5rtZ+y0np0h9Sk/5FEKiEF6qM
 D4maHdke0klXP3zzWEzOD+yyAaZ2EttQ7ZOQgFUFDUy0LFqMU0YQtWkLuMIJqzyoq7
 c4/H7w4+wv5/2HS5Xk8moU4KUfq1z2Wn5kae2H/w=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20200107054644epcas5p12fe67744d0af78cec03d2e9438149164~nhJzz7Bgk1340813408epcas5p12;
 Tue,  7 Jan 2020 05:46:44 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 2D.76.19629.34B141E5; Tue,  7 Jan 2020 14:46:43 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20200107054643epcas5p35ce5b5080632d7d8859ea5ec375df993~nhJzVd2740753307533epcas5p3g;
 Tue,  7 Jan 2020 05:46:43 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200107054643epsmtrp1e194a228dd825c313e8a7c4a84b6da71~nhJzUgyZa2258722587epsmtrp1n;
 Tue,  7 Jan 2020 05:46:43 +0000 (GMT)
X-AuditID: b6c32a4b-345ff70000014cad-86-5e141b43b04a
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 AA.B1.10238.34B141E5; Tue,  7 Jan 2020 14:46:43 +0900 (KST)
Received: from sriramdash03 (unknown [107.111.85.29]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200107054639epsmtip181dafcd142890c0ec4992e6f172b2ea2~nhJvJtYl_2651326513epsmtip1Q;
 Tue,  7 Jan 2020 05:46:38 +0000 (GMT)
From: "Sriram Dash" <sriram.dash@samsung.com>
To: "'Florian Fainelli'" <f.fainelli@gmail.com>, <netdev@vger.kernel.org>
In-Reply-To: <20200107050846.16838-1-f.fainelli@gmail.com>
Date: Tue, 7 Jan 2020 11:16:36 +0530
Message-ID: <011a01d5c51d$d7482290$85d867b0$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-in
Thread-Index: AQI1ZYvsFetxt2LSxnoGVL5lXWNB8wDUcl0vpxjJvRA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02SaUxTURCFvX1LH0v1tYCO4Nq4GwSjJNcloNGYZ9zDDxNjilVfwAiVtICg
 cUVAiyBKlFqxcUGCSF1KsaDWBcEFgiIoQQkoUiQUUQGjVFG0fTXy75uZc+bcSS5DyLJpf2ab
 Ko5Xq5TRctqTvPlw+rTAJQG+iuDv6QvwDVs1widbbTTOfX6IxEVN5Qj/+FQhxh97LxJ48H0X
 hSuq8kS4ZeALhR1pZhE2tTVQuP5WLo21DTYKG34ZKZzakiPGj86NxJU3wvGFkq9iPNhVgrC+
 tpTCmcY6epEf97kxRcyVNuchznz5tYgr0zeLOVPhEZorztvHZZoLEWdpMBDcg7uzufZ+K8GZ
 7/Uhrs80bq33Bs+FW/nobQm8Oih0k2fUQHI2HXvNL9HwxEDvRzVSLfJggJ0L6Z21SIs8GRl7
 G0FyzhuRUPQieF34gRCKbwg+Xb2H/lkcpTq3xYrAduaF22JHcCmvX+xU0Wwg1DQepJ3syy6H
 jrNZrlUEa6Wgs93uGniw86HubTfpZB92M/zKd7jMJDsJBvJ1lJMl7DzoOdknFlgKT0/bXHqC
 HQ+W7lxCeNIEcLTnU0J/FFQ6jhJC8Hx4ZqwnncHApjCQVpXsNiyFQWsrLbAP2B+bxQL7Q+ex
 VDdvh/rMDrc+DnT286TAYXD/Ze5fZv6GTYdrt4KE3OGQ8dMmcraBlcDhVJmgngz2pmL3xgC4
 b6wWCcxB55NqOgtN1A+5TD/kMv2Qa/T/w84hshCN5mM1MZG8JiR2jorfOUujjNHEqyJnbdkR
 Y0KurzpjRSkyPVtZjlgGyb0lWWN8FDJKmaBJiilHwBByX8mBZVKFTLJVmbSLV++IUMdH85py
 FMCQ8lGSE9SrjTI2UhnHb+f5WF79bypiPPz3o8Ts1ou7Q+8UGI/1eYeOp9Thxaf85V0zLel+
 Eb+vR4QcP2xRzDmSs1fbdCWl3ZGhU8SpdPaeomGrbHavXbW95Iuxe6MSg1unBa1Ok05ZF+b1
 zlhgnWr5UrMUL9zUtmZ9XdHi782GU2XLZ2aE9X8r6d7Sk8iHSBNGl2nv7jkvkQ6OiJaTmijl
 7BmEWqP8A+Gt7WWmAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRzGe3duczg4bpqvDiyGRVlTF314s4hSiEN9KPBLFqkHd7zgNsc5
 aimRq8zIRLog6ZJhNSTNYd5ymbaal9TQQkGU0somJV7TJBdb5hyR3348z/N/eD78xZhsCQ8V
 Z+izOV7PapWkBH/WqQxTxSkCE6NXCxWowfkWoLIvThJVvivEUd0HB0C/57soNLv0CENrkzME
 6uq3iNCEe5FAruvNItT4dYRAw22VJCoecRLI7LESqGjiHoV6qrai7oZ49LDlJ4XWZloAMr23
 EajUOkQeCWIWRq9RjG3cApjmmjER89w0TjGNtTdIpslSwJQ21wKmdcSMMa9fqpmp1Q6MabYv
 A2a5MeyU/xnJIQ2nzcjl+KjDyZJ099W7pKE+6IK510wawUBAMfATQ3o/dNnKgZdl9AsA+41k
 MRCv6wroGlf5InJY8+cbVQwk65HvAPYtDlJeg6RVcGD0CunlQPoEdNoXCG8IowcI2GL8LPKV
 3gTQOpvpZT86Bg59msO9LKeTYUdFEeFlnA6H7uryDZbSB+CPsmXKxwGwr8KJewdhdCQsatjY
 idHbYOtcJeYbtx26pqoJnx4Mu10lmG9PDBy0DuO3gNy0qcn0v8m0qcm06boK4LUghDMIujSd
 oDao9dz5SIHVCTn6tMiULF0j2PiEiN02MGxJcgBaDJT+UhQqT5QRbK6Qp3MAKMaUgdLLxwIS
 ZVINm5fP8VlJfI6WExxAIcaVwdIpfU+CjE5js7lMjjNw/D9XJPYLNQJV6tmeCk07Jt3zpv5g
 tXY6vm02JaRPPTJfsqjZksEm84mz4VHuIUmTQdUbPLYjll2JnuzvvP+4/aknNvVi99Hl4+aP
 hvHYvIJygrfvZDxWgdpbm4D23bbPaQnFq12eeA354E5r3LlfTZcmT1fmN9UpolqMYSf51ZVp
 k8P6RIkL6aw6AuMF9i8WEZclBQMAAA==
X-CMS-MailID: 20200107054643epcas5p35ce5b5080632d7d8859ea5ec375df993
X-Msg-Generator: CA
CMS-TYPE: 105P
X-CMS-RootMailID: 20200107050854epcas1p3c1a66e67f14802322063f6c9747f1986
References: <CGME20200107050854epcas1p3c1a66e67f14802322063f6c9747f1986@epcas1p3.samsung.com>
 <20200107050846.16838-1-f.fainelli@gmail.com>
Cc: 'Jose Abreu' <Jose.Abreu@synopsys.com>,
 'Jayati Sahu' <jayati.sahu@samsung.com>, tomeu.vizoso@collabora.com,
 rcsekar@samsung.com, khilman@baylibre.com, mgalka@collabora.com,
 linux-kernel@vger.kernel.org,
 'Padmanabhan Rajanbabu' <p.rajanbabu@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, broonie@kernel.org,
 pankaj.dubey@samsung.com, 'Maxime Coquelin' <mcoquelin.stm32@gmail.com>,
 guillaume.tucker@collabora.com, enric.balletbo@collabora.com,
 'Giuseppe Cavallaro' <peppe.cavallaro@st.com>, "'David S.
 Miller'" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 heiko@sntech.de
Subject: Re: [Linux-stm32] [PATCH net] Revert "net: stmmac: platform: Fix
 MDIO init for platforms without PHY"
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

> From: Florian Fainelli <f.fainelli@gmail.com>
> Subject: [PATCH net] Revert "net: stmmac: platform: Fix MDIO init for
platforms
> without PHY"
> 
> This reverts commit d3e014ec7d5ebe9644b5486bc530b91e62bbf624 ("net:
> stmmac: platform: Fix MDIO init for platforms without PHY") because it
breaks
> existing systems with stmmac which do not have a MDIO bus sub-node nor a
> 'phy-handle' property declared in their Device Tree. On those systems, the
> stmmac MDIO bus is expected to be created and then scanned by
> of_mdiobus_register() to create PHY devices.
> 
> While these systems should arguably make use of a more accurate Device
Tree
> reprensentation with the use of the MDIO bus sub-node an appropriate 'phy-
> handle', we cannot break them, therefore restore the behavior prior to the
said
> commit.
> 
> Fixes: d3e014ec7d5e ("net: stmmac: platform: Fix MDIO init for platforms
> without PHY")
> Reported-by: Heiko Stuebner <heiko@sntech.de>
> Reported-by: kernelci.org bot <bot@kernelci.org>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Nacked-by: Sriram Dash <Sriram.dash@samsung.com>

> ---
> Heiko,
> 
> I did not add the Tested-by because the patch is a little bit different
from what
> you tested, even if you most likely were not hitting the other part that I
was
> changing. Thanks!
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index cc8d7e7bf9ac..bedaff0c13bd 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -320,7 +320,7 @@ static int stmmac_mtl_setup(struct platform_device
> *pdev,  static int stmmac_dt_phy(struct plat_stmmacenet_data *plat,
>  			 struct device_node *np, struct device *dev)  {
> -	bool mdio = false;
> +	bool mdio = true;


This is breaking for the platforms with fixed-link.
stih418-b2199.dts and 169445.dts to name a few.

For the newer platforms, they should provide the mdio/ snps,dwmac-mdio
property in the device tree as we are checking the mdio/ snps,dwmac-mdio
property in the stmmac_platform driver for the mdio bus memory allocation.
For existing platforms, I agree we should not break them, but we should make
the code correct. And make the existing platforms adapt to the proper code.
There is a proposed solution. 
https://lkml.org/lkml/2020/1/7/14

What do you think?

>  	static const struct of_device_id need_mdio_ids[] = {
>  		{ .compatible = "snps,dwc-qos-ethernet-4.10" },
>  		{},
> --
> 2.19.1


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
