Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB539E16E7
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Dec 2024 10:12:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5EDE1C6C83D;
	Tue,  3 Dec 2024 09:12:42 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D8BAC6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Dec 2024 09:12:35 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-7fcc00285a9so2203810a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Dec 2024 01:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733217154; x=1733821954;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5UjROHqftn2vsqoSMMZyNiWVGqcRAwNJX1YG/RKp5Ps=;
 b=OXJAYo7U4NyxfBxxfoUJJ44+XQHCDnbWpJWhw6hZJ+0RVIgznDWkg/dlnh7QEUyoEC
 UEV8Bh6R1X9QxTTt1N+87k88eP2jVJ7/6qXhs2W3FmaDlpWe6D+Y9t6I3Be5hw7ywsCy
 YGJXD2Jhq0M76z0RyZ+d4R1xOibMXEonjORFdPB3MvtI/EqFYBRwhELSIxff2pY89Hfj
 v4uHk4zw4FZ1U0H7bieim5Ev7Whdf6sDHcKs9Wc5d2OuYihvYaQ0HXJMIcfTe633VNYt
 TpwMyDvK6zWqp/PZXX0R1Ljeojp8cj+/1mjF5y2budUEOhfHqBZtB/GwY8CwEYnyXsUI
 0RXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733217154; x=1733821954;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5UjROHqftn2vsqoSMMZyNiWVGqcRAwNJX1YG/RKp5Ps=;
 b=aBuyj5cZDlSTVTiXoNDqMNb11heLoxxbK5SqvHcF7pYWfN9oBxWJQYeto1pFgYEPkg
 kDNXlsEPqqb+0rA9d114wrfOkUFEdrz478Goa/2LlAbaJdSzqdsUhy0YIRAHSMcXHGvq
 qGl7cbKZwRVZaL+CQacmYSlpOxG4fpBEKDMZe4MkJ0CqxjTnoaBTIOrv9F3awgDdd1I7
 +XcSyl+Z2Hh8XJudmnLgl4ofVS01YgfShOvcU0n2WXwq/GpDK7FVNmvWA0HP7JW6ghli
 nzRzP1HkecV9TFaGf7S3Z0zof5TH34Zcl5BbbZq3Wm3ndW8mvNULChltnngyM2oBdEIv
 E4HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcXsDskfng0G0W/KwYGzGXjZRJxIJLB8J8RkdyxRGYbxbCut5/tvwmeTLPhHFGik3ZIhNB6BLB00JAgw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxR14frKMCLSKBdBKq7yD/gDEncy/mAWn2h61MWEmclR+B9WzUz
 p62L2rY41Vmp5KrX0xnwD0tYzPNWKsp1eOrNSmzGtrHJB0wpxq7t
X-Gm-Gg: ASbGncv7d9gibkao2Jww8g4HfAFFTD2h4w0aEsxalejN4C4ueRUe7uMBTfayT0QLndq
 50j8FxglJTIMlP0y8M2osdxWmXhBxXoNCKiVXTsRm9MKhzjTLN+v0QSFApaeMlKuGeB280EHJHA
 HIpJrgxu30H0fcEvibsoxcoUcJWSw7TbsJvDcmtF6FBJwrng4Tddhl6hFym9K8GWpG6desKoQkn
 mLeCceKPJr3K1eP88huHTxIYAtIvJ0ds9Jj+2w7uiTzeXa0wwfx/clUJWQfNZC6VXncqj18VhIZ
 KuF5q31SCOAxhsltl/XQUKKDNToq
X-Google-Smtp-Source: AGHT+IGpVPLJoUHhxn29+2edrat9f3AeLujRdiCcmD98MTLjHojlgwV8qjmmdkbbTsO7m+lEuIUpYg==
X-Received: by 2002:a05:6a20:a104:b0:1e0:c89c:1deb with SMTP id
 adf61e73a8af0-1e1653d01aemr2664742637.20.1733217153608; 
 Tue, 03 Dec 2024 01:12:33 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2156422d2b0sm53180335ad.218.2024.12.03.01.12.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 01:12:33 -0800 (PST)
Message-ID: <75eb13d7-b582-4056-b707-706865611706@gmail.com>
Date: Tue, 3 Dec 2024 17:12:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20241202023643.75010-1-a0987203069@gmail.com>
 <20241202023643.75010-4-a0987203069@gmail.com>
 <9f2c8532-8e52-439a-b253-ad2ceb07b21b@lunn.ch>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <9f2c8532-8e52-439a-b253-ad2ceb07b21b@lunn.ch>
Cc: ychuang3@nuvoton.com, edumazet@google.com, schung@nuvoton.com,
 yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 openbmc@lists.ozlabs.org, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 richardcochran@gmail.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v4 3/3] net: stmmac: dwmac-nuvoton: Add
 dwmac glue for Nuvoton MA35 family
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
Content-Type: multipart/mixed; boundary="===============5237890541306680279=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

This is a multi-part message in MIME format.
--===============5237890541306680279==
Content-Type: multipart/alternative;
 boundary="------------y1WwBj32yHWQaSB0LYdCb0t6"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------y1WwBj32yHWQaSB0LYdCb0t6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Andrew,

You're correct. In the |stmmac_hw_init| function within |stmmac_main.c|, 
whether |pmt| is |true| is determined by checking the 
|pmt_remote_wake_up| bit in the hardware feature register. However, our 
hardware configuration only supports magic packet and not remote wakeup, 
so it must be overwritten in the glue driver. I'm not sure why the 
original code doesn't include magic packet as part of |pmt|.

source code:

         stmmac_hw_init() @net/ethernet/stmicro/stmmac/stmmac_main.c

*        priv->plat->enh_desc = priv->dma_cap.enh_desc;
         priv->plat->pmt = priv->dma_cap.pmt_remote_wake_up &&
                 !(priv->plat->flags & STMMAC_FLAG_USE_PHY_WOL);
         priv->hw->pmt = priv->plat->pmt;*

Or modify the condition as follows:

*        priv->plat->pmt = (priv->dma_cap.pmt_remote_wake_up|| 
priv->dma_cap.pmt_magic_frame) &&
                 !(priv->plat->flags & STMMAC_FLAG_USE_PHY_WOL);*

Thanks!

BR,

Joey*
*

Andrew Lunn 於 12/3/2024 9:43 AM 寫道:
>> +	/* We support WoL by magic packet, override pmt to make it work! */
>> +	plat_dat->pmt = 1;
>> +	device_set_wakeup_capable(&pdev->dev, 1);
> It seems odd to me that there is no WoL support in this glue
> driver. So i assume the core driver is doing it? So why does the core
> driver not set pmt and wakeup_capable ?
>
> 	Andrew
--------------y1WwBj32yHWQaSB0LYdCb0t6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Dear Andrew,</p>
    <p>You're correct. In the <code>stmmac_hw_init</code> function
      within <code>stmmac_main.c</code>, whether <code>pmt</code> is <code>true</code>
      is determined by checking the <code>pmt_remote_wake_up</code> bit
      in the hardware feature register. However, our hardware
      configuration only supports magic packet and not remote wakeup, so
      it must be overwritten in the glue driver. I'm not sure why the
      original code doesn't include magic packet as part of <code>pmt</code>.</p>
    <p>source code:<br>
    </p>
    <p>        stmmac_hw_init()
      @net/ethernet/stmicro/stmmac/stmmac_main.c</p>
    <p><b>        priv-&gt;plat-&gt;enh_desc =
        priv-&gt;dma_cap.enh_desc;<br>
                priv-&gt;plat-&gt;pmt =
        priv-&gt;dma_cap.pmt_remote_wake_up &amp;&amp;<br>
                        !(priv-&gt;plat-&gt;flags &amp;
        STMMAC_FLAG_USE_PHY_WOL);<br>
                priv-&gt;hw-&gt;pmt = priv-&gt;plat-&gt;pmt;</b></p>
    <p>Or modify the condition as follows:<br>
    </p>
    <p><b>        priv-&gt;plat-&gt;pmt =
        (priv-&gt;dma_cap.pmt_remote_wake_up<font color="#ff0000"> ||
          priv-&gt;dma_cap.pmt_magic_frame</font>) &amp;&amp;<br>
                        !(priv-&gt;plat-&gt;flags &amp;
        STMMAC_FLAG_USE_PHY_WOL);</b></p>
    <p>Thanks!</p>
    <p>BR,</p>
    <p>Joey<b><br>
      </b></p>
    <div class="moz-cite-prefix">Andrew Lunn 於 12/3/2024 9:43 AM 寫道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:9f2c8532-8e52-439a-b253-ad2ceb07b21b@lunn.ch">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	/* We support WoL by magic packet, override pmt to make it work! */
+	plat_dat-&gt;pmt = 1;
+	device_set_wakeup_capable(&amp;pdev-&gt;dev, 1);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
It seems odd to me that there is no WoL support in this glue
driver. So i assume the core driver is doing it? So why does the core
driver not set pmt and wakeup_capable ?

	Andrew
</pre>
    </blockquote>
  </body>
</html>

--------------y1WwBj32yHWQaSB0LYdCb0t6--

--===============5237890541306680279==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5237890541306680279==--
