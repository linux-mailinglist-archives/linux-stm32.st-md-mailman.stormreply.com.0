Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C4987DC84
	for <lists+linux-stm32@lfdr.de>; Sun, 17 Mar 2024 08:48:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A8B1C6DD68;
	Sun, 17 Mar 2024 07:48:04 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr
 [80.12.242.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16DF0C6B46B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Mar 2024 07:48:02 +0000 (UTC)
Received: from [192.168.1.18] ([92.140.202.140]) by smtp.orange.fr with ESMTPA
 id llFMrpC6jMNzSllFMr0OlH; Sun, 17 Mar 2024 08:48:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1710661682;
 bh=mEzJNiCeIuCyPTGI5bK0GnD1M3KEqs+A9lx5EB4oaOI=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=bYYRLCjEqD2XxconPtcwpDoRxmtIhBi3HuXsCHQkMDg+DSdHAu5FflclpBRmSuKBo
 uejwQR3KiUhbjJXQmJCCrryh9rXtV2Y9vaIdo4skiFaWjiyk6fuLJM+lH8gqdtXoQF
 QsKj36vxY25V54kHOraf3Yg8VI09ct0mmAQOjCUpjydmFGcoDKe+gv/hwWr63vV2MF
 3z/BFIFDIPobnIAUn9KQDYzlLObgZmnCauSFiPbZ/iguZH1c5QncYvhIa7Keavaxkc
 /SyiNIOrm+bOAF8QXlzAodLGXNRczHb1jXjo/E15zRhCFZA4D/Pw5Hg6PP0ZrO8STp
 Jrt+rLCSj/FNw==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 17 Mar 2024 08:48:02 +0100
X-ME-IP: 92.140.202.140
Message-ID: <2893b234-f657-4562-accd-ef793e24ddd1@wanadoo.fr>
Date: Sun, 17 Mar 2024 08:47:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-MW
To: Wadim Mueller <wafgo01@gmail.com>
References: <20240315222754.22366-1-wafgo01@gmail.com>
 <20240315222754.22366-3-wafgo01@gmail.com>
 <906349a2-97bc-4a09-8d2f-2321435e277d@wanadoo.fr>
 <20240316232928.GA108054@bhlegrsu.conti.de>
From: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240316232928.GA108054@bhlegrsu.conti.de>
Cc: s32@nxp.com, mturquette@baylibre.com, leong.ching.swee@intel.com,
 edumazet@google.com, krzysztof.kozlowski+dt@linaro.org, shenwei.wang@nxp.com,
 festevam@gmail.com, linux-clk@vger.kernel.org, j.zink@pengutronix.de,
 bartosz.golaszewski@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, linux-imx@nxp.com, kuba@kernel.org, pabeni@redhat.com,
 s.hauer@pengutronix.de, ahalaney@redhat.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, horms@kernel.org, richardcochran@gmail.com,
 rmk+kernel@armlinux.org.uk, robh+dt@kernel.org, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, chester62515@gmail.com,
 mcoquelin.stm32@gmail.com, mbrugger@suse.com, sboyd@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, afaerber@suse.de,
 kernel@pengutronix.de, shawnguo@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH 2/3] net: stmmac: Add NXP S32 SoC family
	support
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
Content-Type: multipart/mixed; boundary="===============5070759942721633964=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

This is a multi-part message in MIME format.
--===============5070759942721633964==
Content-Type: multipart/alternative;
 boundary="------------P0ppLWtuMnm4tvWAldwQ09Sg"
Content-Language: en-MW

This is a multi-part message in MIME format.
--------------P0ppLWtuMnm4tvWAldwQ09Sg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

(adding back the mails and ML that got truncated by my mailer in my 
first message. Sorry about that)


Le 17/03/2024 à 00:29, Wadim Mueller a écrit :
> On Sat, Mar 16, 2024 at 10:46:57AM +0100, Christophe JAILLET wrote:
>> Le 15/03/2024 à 23:27, Wadim Mueller a écrit :
>>> Add support for NXP S32 SoC family's GMAC to the stmmac network driver. This driver implementation is based on the patchset originally contributed by Chester Lin [1], which itself draws heavily from NXP's downstream implementation [2]. The patchset was never merged.
>>>
>>> The S32G2/3 SoCs feature multiple Ethernet interfaces (PFE0, PFE1, PFE2, and GMAC) which can be routed through a SerDes Subsystem, supporting various interfaces such as SGMII and RGMII. However, the current Glue Code lacks support for SerDes routing and pinctrl handling, relying solely on correct settings in U-Boot. Clock settings for this SoC are managed by the ATF Firmware.
>>>
>>> Changes made compared to [1]:
>>>
>>>       Rebased onto Linux 6.8-rc7
>>>       Consolidated into a single commit
>>>       Minor adjustments in naming and usage of dev_err()/dev_info()
>>>
>>> Test Environment:
>>> The driver has been successfully tested on the official S32G-VNP-RDB3 Reference Design Board from NXP, utilizing an S32G3 SoC. The firmware and U-Boot used were from the BSP39 Release. The official BSP39 Ubuntu 22.04 Release was successfully booted. A network stress test using iperf [3] was also executed without issues.
>>>
>>> [1]https://patchwork.kernel.org/project/netdevbpf/patch/20221031101052.14956-6-clin@suse.com/#25068228
>>> [2]https://github.com/nxp-auto-linux/linux/blob/release/bsp39.0-5.15.129-rt/drivers/net/ethernet/stmicro/stmmac/dwmac-s32cc.c
>>> [3]https://linux.die.net/man/1/iperf
>>> [4]https://github.com/nxp-auto-linux/u-boot
>>> [5]https://github.com/nxp-auto-linux/arm-trusted-firmware
>>>
>>> Signed-off-by: Wadim Mueller<wafgo01@gmail.com>
>>> ---
>>>    drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
>>>    drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>>>    drivers/net/ethernet/stmicro/stmmac/common.h  |   3 +
>>>    .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 313 ++++++++++++++++++
>>>    .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  |   9 +
>>>    .../net/ethernet/stmicro/stmmac/dwmac4_dma.h  |   3 +
>>>    drivers/net/ethernet/stmicro/stmmac/hwif.h    |   5 +
>>>    .../net/ethernet/stmicro/stmmac/stmmac_main.c |   7 +
>>>    include/linux/stmmac.h                        |   9 +
>>>    9 files changed, 362 insertions(+)
>>>    create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
>>>
>> ...
>>
>>> +	/* DMA cache coherency settings */
>>> +	if (of_dma_is_coherent(pdev->dev.of_node)) {
>>> +		ret = s32_config_cache_coherency(pdev, plat_dat);
>>> +		if (ret)
>>> +			return ret;
>>> +	}
>>> +
>>> +	/* tx clock */
>>> +	gmac->tx_clk = devm_clk_get(&pdev->dev, tx_clk);
>> Hi,
>>
>> If this make sense, here and ...
>>
>>> +	if (IS_ERR(gmac->tx_clk)) {
>>> +		dev_info(&pdev->dev, "tx clock not found\n");
>>> +		gmac->tx_clk = NULL;
>>> +	}
>>> +
>>> +	/* rx clock */
>>> +	gmac->rx_clk = devm_clk_get(&pdev->dev, rx_clk);
>> there could be devm_clk_get_optional_enabled() in order to remove
>> s32_gmac_exit() and simplify s32_gmac_init().
>>
> good point. If I understood you right the
> following patch would implement your proposal?


Yes, that's the idea.
Some other questions/remarks below.


> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> @@ -48,24 +48,7 @@ static int s32_gmac_init(struct platform_device *pdev, void *priv)

s32_gmac_init() could now return void as it always succeed.

>   {
>          struct s32_priv_data *gmac = priv;
>          u32 intf_sel;
> -       int ret;
> -
> -       if (gmac->tx_clk) {
> -               ret = clk_prepare_enable(gmac->tx_clk);
> -               if (ret) {
> -                       dev_err(&pdev->dev, "Can't set tx clock\n");
> -                       return ret;
> -               }
> -       }
> -
> -       if (gmac->rx_clk) {
> -               ret = clk_prepare_enable(gmac->rx_clk);
> -               if (ret) {
> -                       dev_err(&pdev->dev, "Can't set rx clock\n");
> -                       return ret;
> -               }
> -       }
> -
>          /* set interface mode */
>          if (gmac->ctrl_sts) {
>                  switch (gmac->intf_mode) {
> @@ -102,16 +85,6 @@ static int s32_gmac_init(struct platform_device *pdev, void *priv)
>          return 0;
>   }
>   
> -static void s32_gmac_exit(struct platform_device *pdev, void *priv)
> -{
> -       struct s32_priv_data *gmac = priv;
> -
> -       if (gmac->tx_clk)
> -               clk_disable_unprepare(gmac->tx_clk);
> -
> -       if (gmac->rx_clk)
> -               clk_disable_unprepare(gmac->rx_clk);
> -}
>   
>   static void s32_fix_speed(void *priv, unsigned int speed, unsigned int mode)
>   {
> @@ -236,14 +209,14 @@ static int s32_dwmac_probe(struct platform_device *pdev)
>          }
>   
>          /* tx clock */
> -       gmac->tx_clk = devm_clk_get(&pdev->dev, tx_clk);
> +       gmac->tx_clk = devm_clk_get_optional_enabled(&pdev->dev, tx_clk);
>          if (IS_ERR(gmac->tx_clk)) {
>                  dev_info(&pdev->dev, "tx clock not found\n");
>                  gmac->tx_clk = NULL;


I wonder if this should be return PTR_ERR(gmac->tx_clk); here, in order 
to handle the -EPROBE_DEFER case.
with the _optional(), if we get an error, then the clock was found but 
something is wrong. So I guess that we should return the error instead 
of (silently) continuing.


>          }
>   
>          /* rx clock */
> -       gmac->rx_clk = devm_clk_get(&pdev->dev, rx_clk);
> +       gmac->rx_clk = devm_clk_get_optional_enabled(&pdev->dev, rx_clk);
>          if (IS_ERR(gmac->rx_clk)) {
>                  dev_info(&pdev->dev, "rx clock not found\n");
>                  gmac->rx_clk = NULL;


Same.


CJ


> @@ -258,7 +231,6 @@ static int s32_dwmac_probe(struct platform_device *pdev)
>          plat_dat->pmt = 1;
>   
>          plat_dat->init = s32_gmac_init;
> -       plat_dat->exit = s32_gmac_exit;
>          plat_dat->fix_mac_speed = s32_fix_speed;
>   
>          /* safety feature config */
> @@ -267,7 +239,7 @@ static int s32_dwmac_probe(struct platform_device *pdev)
>   
>          if (!plat_dat->safety_feat_cfg) {
>                  dev_err(&pdev->dev, "allocate safety_feat_cfg failed\n");
> -               goto err_gmac_exit;
> +               return -ENODEV;
>          }
>   
>          plat_dat->safety_feat_cfg->tsoee = 1;
> @@ -280,15 +252,7 @@ static int s32_dwmac_probe(struct platform_device *pdev)
>          plat_dat->safety_feat_cfg->prtyen = 1;
>          plat_dat->safety_feat_cfg->tmouten = 1;
>   
> -       ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
> -       if (ret)
> -               goto err_gmac_exit;
> -
> -       return 0;
> -
> -err_gmac_exit:
> -       s32_gmac_exit(pdev, plat_dat->bsp_priv);
> -       return ret;
> +       return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
>   }
>
>> CJ
>>
>>> +	if (IS_ERR(gmac->rx_clk)) {
>>> +		dev_info(&pdev->dev, "rx clock not found\n");
>>> +		gmac->rx_clk = NULL;
>>> +	}
>> ...
>>
--------------P0ppLWtuMnm4tvWAldwQ09Sg
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>(adding back the mails and ML that got truncated by my mailer in
      my first message. Sorry about that)</p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">Le 17/03/2024 à 00:29, Wadim Mueller a
      écrit :<br>
    </div>
    <blockquote type="cite"
      cite="mid:20240316232928.GA108054@bhlegrsu.conti.de">
      <pre class="moz-quote-pre" wrap="">On Sat, Mar 16, 2024 at 10:46:57AM +0100, Christophe JAILLET wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Le 15/03/2024 à 23:27, Wadim Mueller a écrit :
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Add support for NXP S32 SoC family's GMAC to the stmmac network driver. This driver implementation is based on the patchset originally contributed by Chester Lin [1], which itself draws heavily from NXP's downstream implementation [2]. The patchset was never merged.

The S32G2/3 SoCs feature multiple Ethernet interfaces (PFE0, PFE1, PFE2, and GMAC) which can be routed through a SerDes Subsystem, supporting various interfaces such as SGMII and RGMII. However, the current Glue Code lacks support for SerDes routing and pinctrl handling, relying solely on correct settings in U-Boot. Clock settings for this SoC are managed by the ATF Firmware.

Changes made compared to [1]:

     Rebased onto Linux 6.8-rc7
     Consolidated into a single commit
     Minor adjustments in naming and usage of dev_err()/dev_info()

Test Environment:
The driver has been successfully tested on the official S32G-VNP-RDB3 Reference Design Board from NXP, utilizing an S32G3 SoC. The firmware and U-Boot used were from the BSP39 Release. The official BSP39 Ubuntu 22.04 Release was successfully booted. A network stress test using iperf [3] was also executed without issues.

[1] <a class="moz-txt-link-freetext" href="https://patchwork.kernel.org/project/netdevbpf/patch/20221031101052.14956-6-clin@suse.com/#25068228">https://patchwork.kernel.org/project/netdevbpf/patch/20221031101052.14956-6-clin@suse.com/#25068228</a>
[2] <a class="moz-txt-link-freetext" href="https://github.com/nxp-auto-linux/linux/blob/release/bsp39.0-5.15.129-rt/drivers/net/ethernet/stmicro/stmmac/dwmac-s32cc.c">https://github.com/nxp-auto-linux/linux/blob/release/bsp39.0-5.15.129-rt/drivers/net/ethernet/stmicro/stmmac/dwmac-s32cc.c</a>
[3] <a class="moz-txt-link-freetext" href="https://linux.die.net/man/1/iperf">https://linux.die.net/man/1/iperf</a>
[4] <a class="moz-txt-link-freetext" href="https://github.com/nxp-auto-linux/u-boot">https://github.com/nxp-auto-linux/u-boot</a>
[5] <a class="moz-txt-link-freetext" href="https://github.com/nxp-auto-linux/arm-trusted-firmware">https://github.com/nxp-auto-linux/arm-trusted-firmware</a>

Signed-off-by: Wadim Mueller <a class="moz-txt-link-rfc2396E" href="mailto:wafgo01@gmail.com">&lt;wafgo01@gmail.com&gt;</a>
---
  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
  drivers/net/ethernet/stmicro/stmmac/common.h  |   3 +
  .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 313 ++++++++++++++++++
  .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  |   9 +
  .../net/ethernet/stmicro/stmmac/dwmac4_dma.h  |   3 +
  drivers/net/ethernet/stmicro/stmmac/hwif.h    |   5 +
  .../net/ethernet/stmicro/stmmac/stmmac_main.c |   7 +
  include/linux/stmmac.h                        |   9 +
  9 files changed, 362 insertions(+)
  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
...

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+	/* DMA cache coherency settings */
+	if (of_dma_is_coherent(pdev-&gt;dev.of_node)) {
+		ret = s32_config_cache_coherency(pdev, plat_dat);
+		if (ret)
+			return ret;
+	}
+
+	/* tx clock */
+	gmac-&gt;tx_clk = devm_clk_get(&amp;pdev-&gt;dev, tx_clk);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Hi,

If this make sense, here and ...

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+	if (IS_ERR(gmac-&gt;tx_clk)) {
+		dev_info(&amp;pdev-&gt;dev, "tx clock not found\n");
+		gmac-&gt;tx_clk = NULL;
+	}
+
+	/* rx clock */
+	gmac-&gt;rx_clk = devm_clk_get(&amp;pdev-&gt;dev, rx_clk);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
there could be devm_clk_get_optional_enabled() in order to remove
s32_gmac_exit() and simplify s32_gmac_init().

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
good point. If I understood you right the
following patch would implement your proposal?</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Yes, that's the idea.<br>
      Some other questions/remarks below.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20240316232928.GA108054@bhlegrsu.conti.de">
      <pre class="moz-quote-pre" wrap="">
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
@@ -48,24 +48,7 @@ static int s32_gmac_init(struct platform_device *pdev, void *priv)
</pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap=""><span
    style="padding: 0px; tab-size: 8;"
    class="hljs diff colorediffs language-diff"><span
    class="hljs-addition">
s32_gmac_init() could now return void as it always succeed.

</span></span></pre>
    <blockquote type="cite"
      cite="mid:20240316232928.GA108054@bhlegrsu.conti.de">
      <pre class="moz-quote-pre" wrap=""> {
        struct s32_priv_data *gmac = priv;
        u32 intf_sel;
-       int ret;
-
-       if (gmac-&gt;tx_clk) {
-               ret = clk_prepare_enable(gmac-&gt;tx_clk);
-               if (ret) {
-                       dev_err(&amp;pdev-&gt;dev, "Can't set tx clock\n");
-                       return ret;
-               }
-       }
-
-       if (gmac-&gt;rx_clk) {
-               ret = clk_prepare_enable(gmac-&gt;rx_clk);
-               if (ret) {
-                       dev_err(&amp;pdev-&gt;dev, "Can't set rx clock\n");
-                       return ret;
-               }
-       }
-
        /* set interface mode */
        if (gmac-&gt;ctrl_sts) {
                switch (gmac-&gt;intf_mode) {
@@ -102,16 +85,6 @@ static int s32_gmac_init(struct platform_device *pdev, void *priv)
        return 0;
 }
 
-static void s32_gmac_exit(struct platform_device *pdev, void *priv)
-{
-       struct s32_priv_data *gmac = priv;
-
-       if (gmac-&gt;tx_clk)
-               clk_disable_unprepare(gmac-&gt;tx_clk);
-
-       if (gmac-&gt;rx_clk)
-               clk_disable_unprepare(gmac-&gt;rx_clk);
-}
 
 static void s32_fix_speed(void *priv, unsigned int speed, unsigned int mode)
 {
@@ -236,14 +209,14 @@ static int s32_dwmac_probe(struct platform_device *pdev)
        }
 
        /* tx clock */
-       gmac-&gt;tx_clk = devm_clk_get(&amp;pdev-&gt;dev, tx_clk);
+       gmac-&gt;tx_clk = devm_clk_get_optional_enabled(&amp;pdev-&gt;dev, tx_clk);
        if (IS_ERR(gmac-&gt;tx_clk)) {
                dev_info(&amp;pdev-&gt;dev, "tx clock not found\n");
                gmac-&gt;tx_clk = NULL;
</pre>
    </blockquote>
    <p><br>
    </p>
    <p>I wonder if this should be return PTR_ERR(gmac-&gt;tx_clk); here,
      in order to handle the -EPROBE_DEFER case.<br>
      with the _optional(), if we get an error, then the clock was found
      but something is wrong. So I guess that we should return the error
      instead of (silently) continuing.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20240316232928.GA108054@bhlegrsu.conti.de">
      <pre class="moz-quote-pre" wrap="">        }
 
        /* rx clock */
-       gmac-&gt;rx_clk = devm_clk_get(&amp;pdev-&gt;dev, rx_clk);
+       gmac-&gt;rx_clk = devm_clk_get_optional_enabled(&amp;pdev-&gt;dev, rx_clk);
        if (IS_ERR(gmac-&gt;rx_clk)) {
                dev_info(&amp;pdev-&gt;dev, "rx clock not found\n");
                gmac-&gt;rx_clk = NULL;</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Same.</p>
    <p><br>
    </p>
    <p>CJ<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20240316232928.GA108054@bhlegrsu.conti.de">
      <pre class="moz-quote-pre" wrap="">
@@ -258,7 +231,6 @@ static int s32_dwmac_probe(struct platform_device *pdev)
        plat_dat-&gt;pmt = 1;
 
        plat_dat-&gt;init = s32_gmac_init;
-       plat_dat-&gt;exit = s32_gmac_exit;
        plat_dat-&gt;fix_mac_speed = s32_fix_speed;
 
        /* safety feature config */
@@ -267,7 +239,7 @@ static int s32_dwmac_probe(struct platform_device *pdev)
 
        if (!plat_dat-&gt;safety_feat_cfg) {
                dev_err(&amp;pdev-&gt;dev, "allocate safety_feat_cfg failed\n");
-               goto err_gmac_exit;
+               return -ENODEV;
        }
 
        plat_dat-&gt;safety_feat_cfg-&gt;tsoee = 1;
@@ -280,15 +252,7 @@ static int s32_dwmac_probe(struct platform_device *pdev)
        plat_dat-&gt;safety_feat_cfg-&gt;prtyen = 1;
        plat_dat-&gt;safety_feat_cfg-&gt;tmouten = 1;
 
-       ret = stmmac_dvr_probe(&amp;pdev-&gt;dev, plat_dat, &amp;stmmac_res);
-       if (ret)
-               goto err_gmac_exit;
-
-       return 0;
-
-err_gmac_exit:
-       s32_gmac_exit(pdev, plat_dat-&gt;bsp_priv);
-       return ret;
+       return stmmac_dvr_probe(&amp;pdev-&gt;dev, plat_dat, &amp;stmmac_res);
 }

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">CJ

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+	if (IS_ERR(gmac-&gt;rx_clk)) {
+		dev_info(&amp;pdev-&gt;dev, "rx clock not found\n");
+		gmac-&gt;rx_clk = NULL;
+	}
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
...

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------P0ppLWtuMnm4tvWAldwQ09Sg--

--===============5070759942721633964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5070759942721633964==--
