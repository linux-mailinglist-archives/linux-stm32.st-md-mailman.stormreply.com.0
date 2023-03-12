Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7576B6770
	for <lists+linux-stm32@lfdr.de>; Sun, 12 Mar 2023 16:15:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85CE3C69073;
	Sun, 12 Mar 2023 15:15:45 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31EC9C65E59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Mar 2023 15:15:44 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so6341933wmq.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Mar 2023 08:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678634143;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=HKhPGEn48aizwdQtbeZiRqDsuVUTk1YIcEaDe2udzRA=;
 b=gEuJTs8rAj1FCry+rF1CeDbSIJK4LxGMUnOjarG4/VP8KKgqsJUS97hWWDm/LLbiLW
 DNQ0Lgv+r71NlgTtrHCdRkFUVfk67F+DDREcWS4aUT+4VSSOCJmJZsO8W0QkU9rwf7Pt
 Cn53G5xe1ZmguLXX7D5vjKUUiGAvx0jMMHBtIGc0xb6cQC0pyqgYzQq/5exWq7S2NgAw
 puJNDQ7cMwLtW2DmEDwPz2M617RtRbHrqK+okSwZHzrkzpQJMYdHvGJ3PJY/Qo8cR4bp
 uGPv8bwajsDGqCgW0wzlKakgzcPmmU6xg/kmQMWn5STGhVY0qNHM1t9MX50d2RvaCpBy
 MmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678634143;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HKhPGEn48aizwdQtbeZiRqDsuVUTk1YIcEaDe2udzRA=;
 b=fnHXGFFIQyYB9EZHG1gZ5p6+49ql3n8N0cf48opn9M+63WbRiH+n8wDtrgd8rz+SDK
 HL6ukF3EfbiDK9kWP72NL+yJ/O4Kf5j27MZvDXvO5IVwiUVfLL8G2G6SHUjsbGiUT9H6
 Bx76AA14dtF3j0BizOHlmsvqDOXy391oIPrp1+cq7Z/oAJhM1X/+PKfSg0Dzd80+7FaE
 VohU+DZxQVCcVpfilcVJbqkLdFSkpN+FfbgU02wMggLQlodxCSv1sRsswUM3hGkRXRMg
 VbUfSD3wqpdoGO9cvV8QTirat4m3Av2duhdlf5AAdiJ7KPX18r8hgWpduNA9D0WiLEgx
 Yh7g==
X-Gm-Message-State: AO0yUKUMapMUFe0eQAcX6tbsbxrHr9zlXQsvb7FxURSNqDzSy0omfMSb
 H950K2e4RIpbmkj+ZMe9MfA=
X-Google-Smtp-Source: AK7set/bjPBg/zjhzM6DAttzOabIYrkqkkyVgJDWMpQSEhOR00TB9rrFvoFv2QmmclSj+Zkfo4wXvg==
X-Received: by 2002:a05:600c:46cc:b0:3ed:1f9c:aeff with SMTP id
 q12-20020a05600c46cc00b003ed1f9caeffmr2414620wmo.36.1678634143542; 
 Sun, 12 Mar 2023 08:15:43 -0700 (PDT)
Received: from ?IPv6:2a02:168:6806:0:1606:cc8d:640:3d4d?
 ([2a02:168:6806:0:1606:cc8d:640:3d4d])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c444700b003e204fdb160sm6741547wmn.3.2023.03.12.08.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 08:15:42 -0700 (PDT)
Message-ID: <024b696003d8403d62c45411c813058684e0418c.camel@gmail.com>
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Date: Sun, 12 Mar 2023 16:15:41 +0100
In-Reply-To: <0a1ec04fe494fcd8c68d03e4f544d7162c0e4f39.camel@gmail.com>
References: <db6b8a09-b680-4baa-8963-d355ad29eb09@lunn.ch>
 <0e10aa8492eadb587949d8744b56fccaabbd183b.camel@gmail.com>
 <72530e86-9ba9-4a01-9cd2-68835ecae7a0@lunn.ch>
 <09d65e1ee0679e1e74b4f3a5a4c55bd48332f043.camel@gmail.com>
 <70f5bca0-322c-4bae-b880-742e56365abe@lunn.ch>
 <10da10caea22a8f5da8f1779df3e13b948e8a363.camel@gmail.com>
 <4abd56aa-5b9f-4e16-b0ca-11989bb8c764@lunn.ch>
 <bff0e542b8c04980e9e3af1d3e6bf739c87eb514.camel@gmail.com>
 <a57a216d-ff5a-46e6-9780-e53772dcefc8@lunn.ch>
 <2f64385a350359c5755eb4d2479e2efef7a96216.camel@gmail.com>
 <29ee3cc4-a1d6-4a07-8d90-4b2f26059e7d@lunn.ch>
 <0a1ec04fe494fcd8c68d03e4f544d7162c0e4f39.camel@gmail.com>
User-Agent: Evolution 3.46.4-1 
MIME-Version: 1.0
Cc: linux-aspeed@lists.ozlabs.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>,
 Joel Stanley <joel@jms.id.au>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Andrew Jeffery <andrew@aj.id.au>,
 Bryan Whitehead <bryan.whitehead@microchip.com>, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, Michael Walle <michael@walle.cc>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Heiner Kallweit <hkallweit1@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [Linux-stm32] [PATCH net-next v2 4/6] net: mdio: scan bus based
 on bus capabilities for C22 and C45
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

On Sun, 2023-03-12 at 10:04 +0100, Klaus Kudielka wrote:
> On Sun, 2023-03-12 at 03:53 +0100, Andrew Lunn wrote:
> > 
> > Correct. But their also should not of been any noticeable slow down,
> > because there should not be any additional scanning when everything is
> > described in DT. And the move of the MDIO bus registration from probe
> > to setup should actually make it faster than before.
> > 
> 
> But then, why *do* I see such a big difference on the Omnia?
> 
> mdiobus_scan_bus_c45() takes:
> ~2.7 seconds without phy_mask patch
> ~0.2 seconds with phy_mask patch

Following up myself, the answer is in the call path
mv88e6xxx_mdios_register()
	 -> mv88e6xxx_mdio_register()
		-> of_mdiobus_register()

A child node "mdio" would be needed for the scan to be limited by
the device tree. And this one is *not* in armada-385-turris-omnia.dts.

My (incorrect) understanding was, the child node "ports" would trigger
that behaviour.

Best regards, Klaus

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
