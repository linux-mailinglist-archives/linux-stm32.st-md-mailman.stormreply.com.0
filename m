Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 770DF6B63E3
	for <lists+linux-stm32@lfdr.de>; Sun, 12 Mar 2023 10:04:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB11CC69073;
	Sun, 12 Mar 2023 09:04:14 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FD1AC6904F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Mar 2023 09:04:13 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so8897255wmb.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Mar 2023 01:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678611853;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Pc80kOGlqxH4dxS+XiPVwGBzRY6XRSb/pMTBjXDBKDE=;
 b=C3cg//7XD2AcK5g+5oCgxoHKpG4SvHhXCR6v3qVBpiEF+WUBvq8ZZ5tLZALnAauFJj
 rEjcj8NQdRwYA4ux+JtDErrDB5Nzgzw/AjFO7u0h0p6bfBrcaoPow6njYj1Dpibayb5/
 rgQXZOJX2QpGVTOFfuhNc4VViO3V+jQGWDutKXSO3z29+LOIX7NHJe8BgWUeV0Qk+DSk
 mMlP6cSn2QTc59qxxyX991VOGeYMydMOolYIb9WD2htJwDY+uEmUa0Eg8folOgr2R58c
 RDylORvHuf3pHLcGdHNCl4UQ7gXNtsoP/5FQmSl+eZlfQ7tij9W7fxrqeMU92uRl/3o4
 YRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678611853;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Pc80kOGlqxH4dxS+XiPVwGBzRY6XRSb/pMTBjXDBKDE=;
 b=f415JHvvTaVlx2Idq8XO4YSTV49UlvQwrNP6X030LhxeN6PhSY/ChGHy3y/vhKpsM5
 FVSQGrPQqEfAtf50pzS8ENfRh/K9bXPApKihv5a90KB3XpUEUgvjA+L9FMre57eg2l8x
 iJYZvINqeRng3KDrN8LxMDBgaQ+wCOjqkyUdT7LxnMsejVagtz8X98bcYYxBRvh0M/sR
 VRPNXo9OtmBoamadv2/lL/LWU7+12PvUd/otoPwsj/fngTGKrb5MM55E+LephW4ZWkH9
 9pYhhtVbb2rjZFao6qYIZW5SW0N742JaXQ3U0LsfR1lvCu52QgVx33mxI8yQ+3v3X6Y0
 j83Q==
X-Gm-Message-State: AO0yUKU78Hx/PYdTEO8esdZFPy3lOml0H0GpwHiIhnSvE/o82D8LfEvQ
 fZiXh1Z3cljGKaADoeOkzfs=
X-Google-Smtp-Source: AK7set+ky1MP5G4zegthCZnFjMiOBM5971of0IvZsyf8jSOYuUK5Q1+66wGmT3hiJ3eY3UnFWhYJRw==
X-Received: by 2002:a05:600c:1d02:b0:3e9:c2f4:8ad4 with SMTP id
 l2-20020a05600c1d0200b003e9c2f48ad4mr7065700wms.8.1678611853347; 
 Sun, 12 Mar 2023 01:04:13 -0800 (PST)
Received: from ?IPv6:2a02:168:6806:0:b020:289a:731d:fbb8?
 ([2a02:168:6806:0:b020:289a:731d:fbb8])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a1c7417000000b003e11f280b8bsm5233062wmc.44.2023.03.12.01.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 01:04:12 -0800 (PST)
Message-ID: <0a1ec04fe494fcd8c68d03e4f544d7162c0e4f39.camel@gmail.com>
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Date: Sun, 12 Mar 2023 10:04:11 +0100
In-Reply-To: <29ee3cc4-a1d6-4a07-8d90-4b2f26059e7d@lunn.ch>
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

On Sun, 2023-03-12 at 03:53 +0100, Andrew Lunn wrote:
> > 
> > What you are proposing here would not show any improvement on the
> > Omnia, as only the 6 ports would be scanned - right? 
> 
> Correct. But their also should not of been any noticeable slow down,
> because there should not be any additional scanning when everything is
> described in DT. And the move of the MDIO bus registration from probe
> to setup should actually make it faster than before.
> 

But then, why *do* I see such a big difference on the Omnia?

mdiobus_scan_bus_c45() takes:
~2.7 seconds without phy_mask patch
~0.2 seconds with phy_mask patch

(It's not a big deal, but somehow strange)

Regards, Klaus


PS: There was another open question: How long does the first
unsuccessful mv88e6xxx_probe() take, when calling
mv88e6xxx_mdios_register() from mv88e6xxx_setup()?

I would say "negligible":

[    0.194414] mv88e6085 f1072004.mdio-mii:10: *** mv88e6xxx_probe call ***
[    0.194739] mv88e6085 f1072004.mdio-mii:10: switch 0x1760 detected: Marvell 88E6176, revision 1
[    0.208163] mv88e6085 f1072004.mdio-mii:10: *** mv88e6xxx_probe return -517 ***

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
