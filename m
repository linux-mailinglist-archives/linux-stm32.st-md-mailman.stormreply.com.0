Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLoWOl9RjGmukgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Feb 2026 10:52:31 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D61E122FFA
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Feb 2026 10:52:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B31BC87EC8;
	Wed, 11 Feb 2026 09:52:31 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9099AC5A4C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Feb 2026 09:52:29 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2a79998d35aso47216815ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Feb 2026 01:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770803548; x=1771408348;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WlA/0DQhAaLzc62fU7hn+N6h+vP5jTvtak8QscuPTcs=;
 b=lWebkMhgkkTaOpHuoiYXURaWxKevO5ezPUJ6J4R9iN163RchcwpPggD8ss2IEq8FFG
 XbZEmRkQI7g98NtIpCGGCiqQSPIlwfhS6MvH8nNyfgotdd/p1U7QYLFXyq3hEvNusseZ
 JZVGPsWe5hf6QVdrierKDnievy7sJWhU4pvOorf210k25pimxtX+7UJVzT1wY+g6NsA4
 jGzV0bBqZ4BkFxFag2aGZSWtFXmdQmxy+qc8EpLUqfN1S3cIOt9g7j5+TDAja12R7jPp
 fUEklJlIQGPOVxXpfsUdMJ821fSF7h+z3yltyriR++TMuo6RAULhkS9FkpEfqTmWVYff
 d92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770803548; x=1771408348;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WlA/0DQhAaLzc62fU7hn+N6h+vP5jTvtak8QscuPTcs=;
 b=CY3vOt9LivbRpm1qeaFCeCG8efDmANXktS8Xfhjncmos+CgknZ9CUOADUcPoa8KHed
 mZlr0BFNvBJFDGzUU9WJXbZjjIJycNFol5h4Dsi+XeTbcT/pfKXSQ7YVjRfnaXfxPs/M
 6TtCtGOCTdc/FF1Jb/lYSV9GnHqB7nvTlL/JDrYCKfTBsoziCK8S6Xt1/WdB7mvAA8HD
 8QGVK85OvmhsQgFpUZdp4Ja0qm/xhSsYtinBIitigkGL89G8kDl+cfVs8aa1b2i6aG9B
 Mfqme2crH/rohtLu3m4/nSuC1Xkd9+jg2AAoKw4FY5VJUdYDDJnruJ1PtgwKq+IoA4/1
 zmFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6sOVW2cG6s7WQTwUXuCCloOjb1L2HZAgR1Hpvj8A6Smw7rhTJdm2eukbA0GwbSTwB5DfDNuJkShNuww==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxqtOUlshdLW66eddSHrcS7ozJ0V6fNRG+vJa4Jp2kdy3M4c3C8
 /bOWy6ZFipSFYOE3r6akdywfI//bw3BpE/rvCRcWF592Nc3uLPoEGOPS
X-Gm-Gg: AZuq6aLjFWZyXfAE0HlMpeLZKQV7VOrNQy8mYY3mFHxoV96nhQ0MLQVoHUBvuTpSpvm
 hpDQM5NHA39Iq2HcKflErJmXrzZdVRv+p+YDQfQR7MVAArX74WyF8j3SltaeAQuWOQlAslqrQvK
 p3JsE+DjmEorAM4h6gnrJsB4NQ77btFS4pHvFNkYfe7vuf/TSqxu1YoEt2mh74xUk/Sx/1OvazM
 14T1gBMvYcLjcZ/oE9MePXSQ389SFt0iEyTJRPzBm9lAh8Uu8Vxygqof2jKWdmcOx36qXqF7dit
 0yRdoVbC9U5mHa5NeAsv4LjZLEb8ariWgag4jWOUNgXufr9SFBNQ5EWPUgGE4nBwbquMHhymyML
 lIeXpDFVLw2M10pcFp/pt2pSyDRKD40xLzE/LkEhFf6Bu0NYg9aBiXgWWIRq5zEomT/mc0DZO7A
 x+sSNaxY8avqcYyYVZCSm9Juug9tt6c6AD0NsTy2pBNtO4yYnbO3idX56yDaU193jI/KCcMHnmD
 yo1
X-Received: by 2002:a17:902:f54a:b0:2aa:e3ba:d045 with SMTP id
 d9443c01a7336-2ab29b7973fmr14836365ad.8.1770803547808; 
 Wed, 11 Feb 2026 01:52:27 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ab2986edecsm17568455ad.22.2026.02.11.01.52.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 01:52:27 -0800 (PST)
Message-ID: <747b9ab4-6711-426d-95a5-4ce6c8732edd@gmail.com>
Date: Wed, 11 Feb 2026 17:52:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20260210052226.3005666-1-a0987203069@gmail.com>
 <20260210052226.3005666-4-a0987203069@gmail.com>
 <aYsurPBMnzWDZCco@shell.armlinux.org.uk>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <aYsurPBMnzWDZCco@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, ychuang3@nuvoton.com, edumazet@google.com,
 schung@nuvoton.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 openbmc@lists.ozlabs.org, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 richardcochran@gmail.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v12 3/3] net: stmmac:
 dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
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
Content-Type: multipart/mixed; boundary="===============5850816000909793813=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:ychuang3@nuvoton.com,m:edumazet@google.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:openbmc@lists.ozlabs.org,m:joabreu@synopsys.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:peppe.cavallaro@st.com,m:linux-arm-kernel@lists.infradead.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,nuvoton.com,google.com,st-md-mailman.stormreply.com,kernel.org,lists.ozlabs.org,synopsys.com,redhat.com,vger.kernel.org,gmail.com,st.com,lists.infradead.org,davemloft.net];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 6D61E122FFA
X-Rspamd-Action: no action

This is a multi-part message in MIME format.
--===============5850816000909793813==
Content-Type: multipart/alternative;
 boundary="------------aaXpGtG0sny9pfM8rBgrfgfB"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------aaXpGtG0sny9pfM8rBgrfgfB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/10/2026 9:12 PM, Russell King (Oracle) wrote:
> Please note that net-next is currently closed, so you should be sending
> net-next patches with "RFC". See section 1.4 of:
> https://docs.kernel.org/process/maintainer-netdev.html
>
> On Tue, Feb 10, 2026 at 01:22:26PM +0800, Joey Lu wrote:
>> +static int nvt_gmac_setup(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	phy_interface_t phy_mode;
>> +	struct regmap *regmap;
>> +	u32 macid, miscr, reg;
>> +	int ret;
>> +
>> +	regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys", 1, &macid);
>> +	if (IS_ERR(regmap))
>> +		ret = dev_err_probe(dev, PTR_ERR(regmap), "Failed to get sys register\n");
>> +
>> +	if (macid > 1)
>> +		ret = dev_err_probe(dev, -EINVAL, "Invalid sys arguments\n");
>> +
>> +	if (of_get_phy_mode(pdev->dev.of_node, &phy_mode))
>> +		ret = dev_err_probe(dev, -EINVAL, "Missing phy mode property\n");
> If you pass in the plat_dat to this function, then you have access to
> plat_dat->phy_interface. I went through all the dwmac glue code and
> removed such PHY interface gets, so please don't introduce new
> instances.
I'll drop it.
>> +
>> +	miscr = (macid == 0) ? NVT_REG_SYS_GMAC0MISCR : NVT_REG_SYS_GMAC1MISCR;
> I find the use of "miscr" to be the register offset, and "reg" to be
> the register value is confusing. Normally they're the other way around.
I'll update the naming to follow the usual convention, for example, 
using reg for offset and val for value.
>> +
>> +	switch (phy_mode) {
>> +	case PHY_INTERFACE_MODE_RGMII:
>> +	case PHY_INTERFACE_MODE_RGMII_ID:
>> +	case PHY_INTERFACE_MODE_RGMII_RXID:
>> +	case PHY_INTERFACE_MODE_RGMII_TXID:
>> +		ret = nvt_gmac_get_delay(dev, "rx-internal-delay-ps");
>> +		if (ret < 0)
>> +			return ret;
>> +		reg = FIELD_PREP(NVT_RX_DELAY_MASK, ret);
>> +
>> +		ret = nvt_gmac_get_delay(dev, "tx-internal-delay-ps");
>> +		if (ret < 0)
>> +			return ret;
>> +		reg |= FIELD_PREP(NVT_TX_DELAY_MASK, ret);
>> +		break;
>> +	case PHY_INTERFACE_MODE_RMII:
>> +		reg = NVT_MISCR_RMII;
>> +			break;
>> +	default:
>> +		return dev_err_probe(dev, -EINVAL, "Unsupported phy-mode (%d)\n", phy_mode);
>> +	}
>> +
>> +	regmap_update_bits(regmap, miscr,
>> +			   NVT_RX_DELAY_MASK | NVT_TX_DELAY_MASK | NVT_MISCR_RMII, reg);
> Please consider programming the NVT_MISCR_RMII bit via the
> plat_dat->set_phy_intf_sel() method.
I'll switch to using the plat_dat->set_phy_intf_sel() callback and pass 
the required info through private structure.
>
> Is this register preserved over suspend/resume ?

It is not preserved by the GMAC suspend/resume flow and therefore needs 
to be treated as a system register rather than a GMAC local context.

>
> Thanks.
>
--------------aaXpGtG0sny9pfM8rBgrfgfB
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
    <div class="moz-cite-prefix">On 2/10/2026 9:12 PM, Russell King
      (Oracle) wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:aYsurPBMnzWDZCco@shell.armlinux.org.uk">
      <pre wrap="" class="moz-quote-pre">Please note that net-next is currently closed, so you should be sending
net-next patches with "RFC". See section 1.4 of:
<a class="moz-txt-link-freetext" href="https://docs.kernel.org/process/maintainer-netdev.html">https://docs.kernel.org/process/maintainer-netdev.html</a>

On Tue, Feb 10, 2026 at 01:22:26PM +0800, Joey Lu wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static int nvt_gmac_setup(struct platform_device *pdev)
+{
+	struct device *dev = &amp;pdev-&gt;dev;
+	phy_interface_t phy_mode;
+	struct regmap *regmap;
+	u32 macid, miscr, reg;
+	int ret;
+
+	regmap = syscon_regmap_lookup_by_phandle_args(dev-&gt;of_node, "nuvoton,sys", 1, &amp;macid);
+	if (IS_ERR(regmap))
+		ret = dev_err_probe(dev, PTR_ERR(regmap), "Failed to get sys register\n");
+
+	if (macid &gt; 1)
+		ret = dev_err_probe(dev, -EINVAL, "Invalid sys arguments\n");
+
+	if (of_get_phy_mode(pdev-&gt;dev.of_node, &amp;phy_mode))
+		ret = dev_err_probe(dev, -EINVAL, "Missing phy mode property\n");
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
If you pass in the plat_dat to this function, then you have access to
plat_dat-&gt;phy_interface. I went through all the dwmac glue code and
removed such PHY interface gets, so please don't introduce new
instances.
</pre>
    </blockquote>
    I'll drop it.
    <blockquote type="cite"
      cite="mid:aYsurPBMnzWDZCco@shell.armlinux.org.uk">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+	miscr = (macid == 0) ? NVT_REG_SYS_GMAC0MISCR : NVT_REG_SYS_GMAC1MISCR;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I find the use of "miscr" to be the register offset, and "reg" to be
the register value is confusing. Normally they're the other way around.
</pre>
    </blockquote>
    I'll update the naming to follow the usual convention, for example,
    using reg for offset and val for value.
    <blockquote type="cite"
      cite="mid:aYsurPBMnzWDZCco@shell.armlinux.org.uk">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+	switch (phy_mode) {
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+		ret = nvt_gmac_get_delay(dev, "rx-internal-delay-ps");
+		if (ret &lt; 0)
+			return ret;
+		reg = FIELD_PREP(NVT_RX_DELAY_MASK, ret);
+
+		ret = nvt_gmac_get_delay(dev, "tx-internal-delay-ps");
+		if (ret &lt; 0)
+			return ret;
+		reg |= FIELD_PREP(NVT_TX_DELAY_MASK, ret);
+		break;
+	case PHY_INTERFACE_MODE_RMII:
+		reg = NVT_MISCR_RMII;
+			break;
+	default:
+		return dev_err_probe(dev, -EINVAL, "Unsupported phy-mode (%d)\n", phy_mode);
+	}
+
+	regmap_update_bits(regmap, miscr,
+			   NVT_RX_DELAY_MASK | NVT_TX_DELAY_MASK | NVT_MISCR_RMII, reg);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Please consider programming the NVT_MISCR_RMII bit via the
plat_dat-&gt;set_phy_intf_sel() method.</pre>
    </blockquote>
    I'll switch to using the <span style="white-space: pre-wrap">plat_dat-&gt;set_phy_intf_sel() callback and pass the required info through private structure.</span>
    <blockquote type="cite"
      cite="mid:aYsurPBMnzWDZCco@shell.armlinux.org.uk">
      <pre wrap="" class="moz-quote-pre">

Is this register preserved over suspend/resume ?</pre>
    </blockquote>
    <p>It is not preserved by the GMAC suspend/resume flow and therefore
      needs to be treated as a system register rather than a GMAC local
      context.</p>
    <blockquote type="cite"
      cite="mid:aYsurPBMnzWDZCco@shell.armlinux.org.uk">
      <pre wrap="" class="moz-quote-pre">

Thanks.

</pre>
    </blockquote>
  </body>
</html>

--------------aaXpGtG0sny9pfM8rBgrfgfB--

--===============5850816000909793813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5850816000909793813==--
