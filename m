Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8114D9E64B3
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Dec 2024 04:18:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33834C6DD9A;
	Fri,  6 Dec 2024 03:18:04 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75A56C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2024 03:17:56 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-215bd2c32a6so13297315ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Dec 2024 19:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733455075; x=1734059875;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+2PCozrlzgkk4F9S6TYNgGPd0ZRNLkVWbIj1PK8TFjk=;
 b=XQTZmm2yKqKLzVIe5Nuwmm3aYCdT8MjTIKfub/hPh7eb3F+f9cTTKzBW4pptgon8f8
 Ri2Tw1Blf/MAkXYyOFPt50rtOoEuG6h/j2CuTFo4k59tmEq2GAHcCV9NpZzEqB9tcwnM
 jVlKAnMn1Ky+ETjQuUw4qLfLmbJj4hlYeaqSkbGdTN15xr2s/0sqgqSf1MwQPWfAYNiV
 hAwznHdvYXinvEXUAHgIzSlcC7+SvqAODw3s3DRrHNgZLc00OH2h0ARGxJp0JZpLvMQU
 lxD4UvRUs7a1urltUaEck3wuOGfd8JKrYnPvw7gprglovnVNNPJbrBg+HjeuZQRauYCM
 vFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733455075; x=1734059875;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+2PCozrlzgkk4F9S6TYNgGPd0ZRNLkVWbIj1PK8TFjk=;
 b=H/VIB1joSPvgSkbB7lQj+Ojn8Ya6a3kUOaZ1k8vHjDY3dvGVjK7DGYPmlFc35lgMWU
 H1Gpx+Unr5l0WHT90uTc9JsiH/FsSSIX7d7nsgbIUL18v2CI7APT2SeB+ZlHZ671pT9C
 kmnN0NnR4GhDxtPqWzLmr/kbeWjCdZBsQSUExslUuUceMjOC7qz8vFGVIA6bOyWUaYlK
 ZRMRsRURndn0PWzb9gsbCN99v+ughr8O/IG6z+vc3gF4wtqesOuVKYdCE6GpT2IjS8ja
 vWHUiSYIRyyg5sEwhzFpKBH8Rh/Ogo8u1Moqb28xE0VcPYTJuExlTBhl313oEOZz8T3P
 NUuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSXm/wXZCIMyLbEWoswsIbX0WJOXDfpVbfs1Ixwl+fCPnPeQODL40JvBWZz75mD0wJawocXdIjK4R4mw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzGw/pkW45gvzYBjQBW09zstNRku2fUP6lyNBe9AGH+Fgl1+rS1
 mobrpNxVwmETflLDr2tJHZSflp6f+ojr1na2BOnYLVprjI+y0n87
X-Gm-Gg: ASbGnct2fdbMf/8mf5yOU06rQal0S2CfFOEtpvzENgsdmWxqITXufNDnikSC0KnBQy6
 +isenaYV0ZcnmvLzBWxDxjknD3iA7+dcvsQxYT72NPsueCcwASHVoBS4miMiZp8b7SxEe414/5d
 PWsU0fgFBdL/g3GrTgJJZgImhdLKpTOslHK7wZ5D5QiFIxZzkZo8DRjh3F7nlZGlFL/Gr9K+IXS
 4iwPi1dWFSYO/8PrOy9B0sU5gA9yBqBAScEj4FkcNsbtvDg9vYQYNVSjg3njqx1mKAx5VxyKULc
 23mITbB2puIIa9Yehl2E2x2EELLM
X-Google-Smtp-Source: AGHT+IGDlgK5ekXU1dDHXYTMek3JFEwGnrBNY4Rq6mtyCRiHABLK12AyQB+it31T7CPCmp44KWDIkw==
X-Received: by 2002:a17:902:cad1:b0:215:7cde:7fa3 with SMTP id
 d9443c01a7336-21614d607d7mr15764585ad.25.1733455074908; 
 Thu, 05 Dec 2024 19:17:54 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-215f8f09487sm19543975ad.181.2024.12.05.19.17.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2024 19:17:54 -0800 (PST)
Message-ID: <b571fcd4-fb76-4538-8e73-4fc98e455b14@gmail.com>
Date: Fri, 6 Dec 2024 11:17:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20241202023643.75010-1-a0987203069@gmail.com>
 <20241202023643.75010-4-a0987203069@gmail.com>
 <9f2c8532-8e52-439a-b253-ad2ceb07b21b@lunn.ch>
 <75eb13d7-b582-4056-b707-706865611706@gmail.com>
 <ba09cea2-4cf7-4203-ae98-ea5d8413f69e@lunn.ch>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <ba09cea2-4cf7-4203-ae98-ea5d8413f69e@lunn.ch>
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
Content-Type: multipart/mixed; boundary="===============1839280739104602780=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

This is a multi-part message in MIME format.
--===============1839280739104602780==
Content-Type: multipart/alternative;
 boundary="------------n00hxg0U6LlaFrj0mkXlgU8G"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------n00hxg0U6LlaFrj0mkXlgU8G
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Andrew Lunn 於 12/3/2024 10:58 PM 寫道:
> On Tue, Dec 03, 2024 at 05:12:24PM +0800, Joey Lu wrote:
>> Dear Andrew,
>>
>> You're correct. In the stmmac_hw_init function within stmmac_main.c, whether
>> pmt is true is determined by checking the pmt_remote_wake_up bit in the
>> hardware feature register. However, our hardware configuration only supports
>> magic packet and not remote wakeup, so it must be overwritten in the glue
>> driver.
> Please add a comment explaining this.
>
>
> I'm not sure why the original code doesn't include magic packet as part
>> of pmt.
>>
>> source code:
>>
>>          stmmac_hw_init() @net/ethernet/stmicro/stmmac/stmmac_main.c
>>
>>          priv->plat->enh_desc = priv->dma_cap.enh_desc;
>>          priv->plat->pmt = priv->dma_cap.pmt_remote_wake_up &&
>>                  !(priv->plat->flags & STMMAC_FLAG_USE_PHY_WOL);
>>          priv->hw->pmt = priv->plat->pmt;
>>
>> Or modify the condition as follows:
>>
>>          priv->plat->pmt = (priv->dma_cap.pmt_remote_wake_up || priv->
>> dma_cap.pmt_magic_frame) &&
>>                  !(priv->plat->flags & STMMAC_FLAG_USE_PHY_WOL);
> Are there other glue drivers which would benefit from this? It is hard
> for me to say if you hardware is odd, or if this should be a generic
> feature which other glue drivers would use.
>
> 	Andrew

After reviewing the Synopsys DWMAC databook, it turns out that RWK is 
actually optional.

I reviewed the usage of the PMT flag in the core driver. In 
|/stmmac_ethtool.c/|, within the |/stmmac_set_wol/| function, the driver 
supports two wake-up methods corresponding to |/pmt_remote_wake_up/| 
and/|pmt_magic_frame|/. When the hardware is configured for magic packet 
only, |device_can_wakeup()| returns not supported. However, magic packet 
is the more widely used option.

In |/stmmac_hw_init()/|, adding a condition to check |pmt_magic_frame| 
for PMT flag will not affect the existing glue layer drivers, regardless 
of whether they config only RWK or both RWK and MGK.

However, it is hard for me to decide whether to modify stmmac driver. 
Overwriting the PMT flag and leaving a comment is fine for me.

BR,

Joey

--------------n00hxg0U6LlaFrj0mkXlgU8G
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">Andrew Lunn 於 12/3/2024 10:58 PM 寫道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:ba09cea2-4cf7-4203-ae98-ea5d8413f69e@lunn.ch">
      <pre wrap="" class="moz-quote-pre">On Tue, Dec 03, 2024 at 05:12:24PM +0800, Joey Lu wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Dear Andrew,

You're correct. In the stmmac_hw_init function within stmmac_main.c, whether
pmt is true is determined by checking the pmt_remote_wake_up bit in the
hardware feature register. However, our hardware configuration only supports
magic packet and not remote wakeup, so it must be overwritten in the glue
driver.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Please add a comment explaining this. 


I'm not sure why the original code doesn't include magic packet as part
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">of pmt.

source code:

        stmmac_hw_init() @net/ethernet/stmicro/stmmac/stmmac_main.c

        priv-&gt;plat-&gt;enh_desc = priv-&gt;dma_cap.enh_desc;
        priv-&gt;plat-&gt;pmt = priv-&gt;dma_cap.pmt_remote_wake_up &amp;&amp;
                !(priv-&gt;plat-&gt;flags &amp; STMMAC_FLAG_USE_PHY_WOL);
        priv-&gt;hw-&gt;pmt = priv-&gt;plat-&gt;pmt;

Or modify the condition as follows:

        priv-&gt;plat-&gt;pmt = (priv-&gt;dma_cap.pmt_remote_wake_up || priv-&gt;
dma_cap.pmt_magic_frame) &amp;&amp;
                !(priv-&gt;plat-&gt;flags &amp; STMMAC_FLAG_USE_PHY_WOL);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Are there other glue drivers which would benefit from this? It is hard
for me to say if you hardware is odd, or if this should be a generic
feature which other glue drivers would use.

	Andrew</pre>
    </blockquote>
    <p>After reviewing the Synopsys DWMAC databook, it turns out that
      RWK is actually optional.</p>
    <p>I reviewed the usage of the PMT flag in the core driver. In <code><i>stmmac_ethtool.c</i></code>,
      within the <code><i>stmmac_set_wol</i></code> function, the
      driver supports two wake-up methods corresponding to <code><i>pmt_remote_wake_up</i></code>
      and<i> <code>pmt_magic_frame</code></i>. When the hardware is
      configured for magic packet only, <code>device_can_wakeup()</code>
      returns not supported. However, magic packet is the more widely
      used option.</p>
    <p>In <code><i>stmmac_hw_init()</i></code>, adding a condition to
      check <code>pmt_magic_frame</code> for PMT flag will not affect
      the existing glue layer drivers, regardless of whether they config
      only RWK or both RWK and MGK.</p>
    <p>However, it is hard for me to decide whether to modify stmmac
      driver. Overwriting the PMT flag and leaving a comment is fine for
      me.</p>
    <p>BR,</p>
    <p>Joey</p>
  </body>
</html>

--------------n00hxg0U6LlaFrj0mkXlgU8G--

--===============1839280739104602780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1839280739104602780==--
