Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D4812F8D0
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Jan 2020 14:36:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF899C36B0B;
	Fri,  3 Jan 2020 13:36:17 +0000 (UTC)
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54A76C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jan 2020 13:31:05 +0000 (UTC)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200103133101epoutp02d6d3ddc6fb8057649a6558df343bca56~mY6Czhid02422324223epoutp02H
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jan 2020 13:31:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200103133101epoutp02d6d3ddc6fb8057649a6558df343bca56~mY6Czhid02422324223epoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578058261;
 bh=CzotQGxCyi/4dtz9P6CgUOC3NUvi0KvaTzWTnRskAYg=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=uT8xCfxszMH/RX/DN0Sh+TmBRI7lhzvgUeF3cvWzIItJS2a6/mwG8jwmq5orhYWD2
 rdhy8Z0v7m1iCoWhYU9Kdof8x7VxgMQCVPmxMI409AkEyn99lN8KAbkUCozpHETh8r
 w71vpCT2nfcoJN0D+l+Tea/DKT99LhcNUphG/7nw=
Received: from epsmges5p2new.samsung.com (unknown [182.195.42.74]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20200103133100epcas5p265f43c43a0ea458a2ac2d01fbe5f156f~mY6COk7nD0816308163epcas5p26;
 Fri,  3 Jan 2020 13:31:00 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 F5.46.20197.4124F0E5; Fri,  3 Jan 2020 22:31:00 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20200103133100epcas5p49bc475820cb614412fb1044c61d6c6fe~mY6B54Ix62781027810epcas5p4_;
 Fri,  3 Jan 2020 13:31:00 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200103133100epsmtrp176dc4f79dacb1dcb472defec5142f6de~mY6B4qCjI1859918599epsmtrp1N;
 Fri,  3 Jan 2020 13:31:00 +0000 (GMT)
X-AuditID: b6c32a4a-781ff70000014ee5-09-5e0f42144144
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 C4.8A.06569.4124F0E5; Fri,  3 Jan 2020 22:31:00 +0900 (KST)
Received: from sriramdash03 (unknown [107.111.85.29]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200103133056epsmtip21282c02fda30a33d35e1e18607224912~mY5_rLsKO0217902179epsmtip2k;
 Fri,  3 Jan 2020 13:30:56 +0000 (GMT)
From: "Sriram Dash" <sriram.dash@samsung.com>
To: "'kernelci.org bot'" <bot@kernelci.org>, <tomeu.vizoso@collabora.com>,
 <khilman@baylibre.com>, "'David S. Miller'" <davem@davemloft.net>,
 <mgalka@collabora.com>, <guillaume.tucker@collabora.com>,
 <broonie@kernel.org>, "'Jayati Sahu'" <jayati.sahu@samsung.com>,
 "'Padmanabhan Rajanbabu'" <p.rajanbabu@samsung.com>,
 <enric.balletbo@collabora.com>, <narmstrong@baylibre.com>
In-Reply-To: <5e0314da.1c69fb81.a7d63.29c1@mx.google.com>
Date: Fri, 3 Jan 2020 19:00:55 +0530
Message-ID: <03ca01d5c23a$09921d00$1cb65700$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-in
Thread-Index: AQHVkLQqlgs7zItKQK6JQygQi6mu7gG5ib8fp8uBzjA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02SaUwTURSF8zpLh8rgWCpcITFaJVEUEIPxucQVkwlq1Jj4Qw1SdQLIagfc
 4oKKqI0WoxKlQaVKaiQiUssiKktxQQmoCChhMdW6UBeKK7jTDkT+fe/ec955J3kMocyk/ZjY
 xBRBm6iJV9MKsqRm4oQg1YLhkVO63gfgInsdwo2tVRTOstlpnPMwncSX26wIv/90gcC3H+TJ
 cOcvJ4X7Dlpk2PyyhcJPynNorGuxU/js7wIKZ3SekmOrfg2+m+uD7xStxOeLv8jx33fFCBse
 lVFYX9BIzxvJdz87IOfLOvIQb7nUKuOvGzrkvDn/MM3f7PLkr+Xt4fWWfMRXV4Tyr3pvEbyl
 8jPiP5tHL/dcrZi9UYiP3SJoQ+ZEKWLq6/LlyZaZ24oKK8g0VByiQx4McGHQ2aJDOqRglNwN
 BMUfL8ilwycE5nYz6VIpuW8I9FfZQcfrL7UDjlsIch1naEnkQFB5ws00FwT1z/bRLpGK20uA
 zvRI7loQXAkBH4zrXOzBzYATXU63wZuLBFv3GXcayY2HbFuFW8/2a0prz9ESj4D72XZSumcS
 mIzvCOlFY6DvlYmS5r5wp++Ie67iZsKPp+fddYDby0Da2xYkGcKhwVFLSewNjnsWucR+0JWZ
 McBx8ET/ZiAgBU47jKTEc6GqKaefmf6wiVBYHiLlesHRn3aZawwcC4cylJI6ABxt1wZu9Ieq
 gjqZxDxU1n+VHUNjDUOaGYY0MwxpY/gflovIfDRKSBYTogVxWvLURGFrsKhJEFMTo4M3JCWY
 kfubBkaUIVPDEiviGKT2ZKPGDY9UUpot4vYEKwKGUKvYrSvYSCW7UbN9h6BNWqdNjRdEK/Jn
 SLUve5xqXqvkojUpQpwgJAvawa2M8fBLQ2Nipz8IKBpmC3sxRxaI+dzv4aWF8MHre02KuPNS
 hGlD49iakv1+x4UdhX9iFrcvvPKnur1x/HpFBPPzojM9qSHLdjIUrWx7Prs5blGPcfd8o3mZ
 Mrt7d9bm0lB2WbiPM1M133k3r+mez6pZK4J7R8zo9lerJvds0gQ93ryrfKlPeoWaFGM0oYGE
 VtT8AyBZk4WiAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCIsWRmVeSWpSXmKPExsWy7bCSvK6IE3+cwcd//BYbn5xmtLh08wCr
 xdSHT9gs5pxvYbFYc/sQo8WbT4uZLY6cWsJkce/PB1aLn+1bmCw2Pb7GanF51xw2i65rT1gt
 5v1dy2rRdm86u8WhvmiLYwvELI5uDLZYtPULu8X/11sZLWZd2MFq0bf2EpuDqMf7G63sHjvu
 LmH02LLyJpPHzll32T02repk89jzksdj85J6j74tqxg9Du4z9Hj6Yy+zx5b9nxk9Pm+SC+CJ
 4rJJSc3JLEst0rdL4Mr4ueohU8EKy4oD0/4xNTAu1Oti5OSQEDCRePblBGMXIxeHkMBuRonH
 R3axdTFyACWkJX7e1YWoEZZY+e85O0TNC0aJDY1PWEASbAK6EmdvNLGBJEQEupklfr/+zwSS
 YBbYxyxx4XQKREcXo8SKBY1gCU4BS4nJLz+wgdjCAjESp65cYAexWQRUJGY+3Adm8wLVbD8x
 nw3CFpQ4ORNiG7OAtsTTm0/h7GULXzNDnKcg8fPpMlaIuLjE0Z89YHERASuJX9cXsU9gFJ6F
 ZNQsJKNmIRk1C0n7AkaWVYySqQXFuem5xYYFRnmp5XrFibnFpXnpesn5uZsYwWlBS2sH44kT
 8YcYBTgYlXh4E5T544RYE8uKK3MPMUpwMCuJ8JYH8sYJ8aYkVlalFuXHF5XmpBYfYpTmYFES
 55XPPxYpJJCeWJKanZpakFoEk2Xi4JRqYJQKrdlW2VPy8VfUlqdntpw6WFdopxV30G3y1tsC
 xxvlLigvZbxv83UPC8fRNzbr5pZt9C6Z9mPRvrrv5fp5rS59Dj5/Xq1tLJ++7KnXCceer9Nz
 r+yV7k4yYH/jvY3jaFilbuS/c+Llux5uODz/zq44i5LjTOGPWeUiFCp9Pr77c/n6yleLvSco
 sRRnJBpqMRcVJwIAGq7YXAcDAAA=
X-CMS-MailID: 20200103133100epcas5p49bc475820cb614412fb1044c61d6c6fe
X-Msg-Generator: CA
CMS-TYPE: 105P
X-CMS-RootMailID: 20191225075056epcas4p2ab51fc6ff1642705a61f906189bb29f0
References: <CGME20191225075056epcas4p2ab51fc6ff1642705a61f906189bb29f0@epcas4p2.samsung.com>
 <5e0314da.1c69fb81.a7d63.29c1@mx.google.com>
X-Mailman-Approved-At: Fri, 03 Jan 2020 13:36:16 +0000
Cc: 'Jose	Abreu' <Jose.Abreu@synopsys.com>, rcsekar@samsung.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "'David S. Miller'" <davem@davemloft.net>,
 'Maxime Coquelin' <mcoquelin.stm32@gmail.com>, pankaj.dubey@samsung.com,
 'Giuseppe Cavallaro' <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] broonie-regmap/for-next bisection: boot on
 ox820-cloudengines-pogoplug-series-3
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

> From: kernelci.org bot <bot@kernelci.org>
> Subject: broonie-regmap/for-next bisection: boot on ox820-cloudengines-
> pogoplug-series-3
> 
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> * This automated bisection report was sent to you on the basis  *
> * that you may be involved with the breaking commit it has      *
> * found.  No manual investigation has been done to verify it,   *
> * and the root cause of the problem may be somewhere else.      *
> *                                                               *
> * If you do send a fix, please include this trailer:            *
> *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
> *                                                               *
> * Hope this helps!                                              *
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> 
> broonie-regmap/for-next bisection: boot on ox820-cloudengines-pogoplug-
> series-3
> 
> Summary:
>   Start:      46cf053efec6 Linux 5.5-rc3
>   Details:    https://protect2.fireeye.com/url?k=36fb52ed-6b2b5a21-36fad9a2-
> 000babff3793-
> f64e7c227e0a8b34&u=https://kernelci.org/boot/id/5e02ce65451524462f9731
> 4f
>   Plain log:  https://protect2.fireeye.com/url?k=58f5fc3b-0525f4f7-58f47774-
> 000babff3793-f96a18481add0d7f&u=https://storage.kernelci.org//broonie-
> regmap/for-next/v5.5-rc3/arm/oxnas_v6_defconfig/gcc-8/lab-
> baylibre/boot-ox820-cloudengines-pogoplug-series-3.txt
>   HTML log:   https://protect2.fireeye.com/url?k=eaed2629-b73d2ee5-
> eaecad66-000babff3793-
> 84ba1e41025b4f73&u=https://storage.kernelci.org//broonie-regmap/for-
> next/v5.5-rc3/arm/oxnas_v6_defconfig/gcc-8/lab-baylibre/boot-ox820-
> cloudengines-pogoplug-series-3.html
>   Result:     d3e014ec7d5e net: stmmac: platform: Fix MDIO init for platforms
> without PHY
> 
> Checks:
>   revert:     PASS
>   verify:     PASS
> 
> Parameters:
>   Tree:       broonie-regmap
>   URL:
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git
>   Branch:     for-next
>   Target:     ox820-cloudengines-pogoplug-series-3
>   CPU arch:   arm
>   Lab:        lab-baylibre
>   Compiler:   gcc-8
>   Config:     oxnas_v6_defconfig
>   Test suite: boot
> 
> Breaking commit found:
> 
> -------------------------------------------------------------------------------
> commit d3e014ec7d5ebe9644b5486bc530b91e62bbf624
> Author: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
> Date:   Thu Dec 19 15:47:01 2019 +0530
> 
>     net: stmmac: platform: Fix MDIO init for platforms without PHY
> 
>     The current implementation of "stmmac_dt_phy" function initializes
>     the MDIO platform bus data, even in the absence of PHY. This fix
>     will skip MDIO initialization if there is no PHY present.
> 
>     Fixes: 7437127 ("net: stmmac: Convert to phylink and remove phylib logic")
>     Acked-by: Jayati Sahu <jayati.sahu@samsung.com>
>     Signed-off-by: Sriram Dash <sriram.dash@samsung.com>
>     Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
>     Signed-off-by: David S. Miller <davem@davemloft.net>
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index bedaff0c13bd..cc8d7e7bf9ac 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -320,7 +320,7 @@ static int stmmac_mtl_setup(struct platform_device
> *pdev,  static int stmmac_dt_phy(struct plat_stmmacenet_data *plat,
>  			 struct device_node *np, struct device *dev)  {
> -	bool mdio = true;
> +	bool mdio = false;
>  	static const struct of_device_id need_mdio_ids[] = {
>  		{ .compatible = "snps,dwc-qos-ethernet-4.10" },
>  		{},
> -------------------------------------------------------------------------------
> 
> 
> Git bisection log:
> 
> -------------------------------------------------------------------------------
> git bisect start
> # good: [e42617b825f8073569da76dc4510bfa019b1c35a] Linux 5.5-rc1 git
> bisect good e42617b825f8073569da76dc4510bfa019b1c35a
> # bad: [46cf053efec6a3a5f343fead837777efe8252a46] Linux 5.5-rc3 git bisect
> bad 46cf053efec6a3a5f343fead837777efe8252a46
> # good: [2187f215ebaac73ddbd814696d7c7fa34f0c3de0] Merge tag 'for-5.5-
> rc2-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
> git bisect good 2187f215ebaac73ddbd814696d7c7fa34f0c3de0
> # good: [0dd1e3773ae8afc4bfdce782bdeffc10f9cae6ec] pipe: fix empty pipe
> check in pipe_write() git bisect good
> 0dd1e3773ae8afc4bfdce782bdeffc10f9cae6ec
> # good: [040cda8a15210f19da7e29232c897ca6ca6cc950] Merge tag 'wireless-
> drivers-2019-12-17' of
> git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers
> git bisect good 040cda8a15210f19da7e29232c897ca6ca6cc950
> # bad: [4bfeadfc0712bbc8a6556eef6d47cbae1099dea3] Merge branch 'sfc-
> fix-bugs-introduced-by-XDP-patches'
> git bisect bad 4bfeadfc0712bbc8a6556eef6d47cbae1099dea3
> # good: [0fd260056ef84ede8f444c66a3820811691fe884] Merge
> git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf
> git bisect good 0fd260056ef84ede8f444c66a3820811691fe884
> # good: [90b3b339364c76baa2436445401ea9ade040c216] net: hisilicon: Fix a
> BUG trigered by wrong bytes_compl git bisect good
> 90b3b339364c76baa2436445401ea9ade040c216
> # bad: [4c8dc00503db24deaf0b89dddfa84b7cba7cd4ce] qede: Disable
> hardware gro when xdp prog is installed git bisect bad
> 4c8dc00503db24deaf0b89dddfa84b7cba7cd4ce
> # bad: [28a3b8408f70b646e78880a7eb0a97c22ace98d1] net/smc: unregister
> ib devices in reboot_event git bisect bad
> 28a3b8408f70b646e78880a7eb0a97c22ace98d1
> # bad: [d3e014ec7d5ebe9644b5486bc530b91e62bbf624] net: stmmac:
> platform: Fix MDIO init for platforms without PHY git bisect bad
> d3e014ec7d5ebe9644b5486bc530b91e62bbf624
> # good: [af1c0e4e00f3cc76cb136ebf2e2c04e8b6446285] llc2: Fix return
> statement of llc_stat_ev_rx_null_dsap_xid_c (and _test_c) git bisect good
> af1c0e4e00f3cc76cb136ebf2e2c04e8b6446285
> # first bad commit: [d3e014ec7d5ebe9644b5486bc530b91e62bbf624] net:
> stmmac: platform: Fix MDIO init for platforms without PHY
> -------------------------------------------------------------------------------


The mdio bus will be allocated in case of a phy transceiver is on board, but if
fixed-link is configured, it will be NULL and of_mdiobus_register will
not take effect.
The commit d3e014ec7d5e fixes the code for fixed-link configuration.
However, some platforms like oxnas820 which have phy
transceivers (rgmii), fail. This is because the platforms expect the allocation
of mdio_bus_data during stmmac_dt_phy. 

Proper solution to this is adding the mdio node in the device tree of the
platform which can be fetched by stmmac_dt_phy.

A rough addition to the Ethernet node can be as follows:


        pinctrl-names = "default";
        pinctrl-0 = <&pinctrl_etha_mdio>;
+       mdio {
+               compatible = "snps,dwmac-mdio";
+               #address-cells = <1>;
+               #size-cells = <0>;
+       };
 };


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
