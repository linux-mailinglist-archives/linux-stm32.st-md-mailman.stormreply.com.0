Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F36E97FBEFB
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Nov 2023 17:09:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2C02C6B46B;
	Tue, 28 Nov 2023 16:09:46 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E7C8C6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Nov 2023 16:09:45 +0000 (UTC)
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E245F4033A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Nov 2023 16:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1701187783;
 bh=pEKPe8cq8iCO+hKEkwpNbBcU/bv+bYZjuOAiUbbFTmw=;
 h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=MO+W63+cRGwvaE4iadeXs8g6lSdXYD0uaCAJFP2OmR646Nqa/dG88manE8XLAcFNv
 KNcD/k2aU9C4JeT1ogIenMQViV/yEX/bht/ONCcz7ThG0c7aPjpyBTASrUYC8jaL1w
 H0nrgwvZo3u3mpfzVilsNRYKdv6VKBJhnSqqXHumbWcLpiDOjjClndlSEnatXcCEGR
 w16TLE9arWTrZgUptVl3W7qjQXAfRBAip7XOQOa5Qf0/P0LWQ1ZuyC8cjxhtX9mehE
 0VjUJLxDfqNrWPzkcJAOzngL7N5DPWwosAeChUdlydiDguwswKbh8pflel0siTkWN3
 xSEk2QSQBNNfA==
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-67a238351b7so41950436d6.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Nov 2023 08:09:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701187782; x=1701792582;
 h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pEKPe8cq8iCO+hKEkwpNbBcU/bv+bYZjuOAiUbbFTmw=;
 b=n9+eDu7zg9UEb0BE5+gwj6shefwdA2X+eEIwR/WLADMv1oroMuiGLn2relhlriKi0g
 GkPamicSgzDX56McJsonzSOcLfxMrWtSQ/aDh2GiWMBAw2UC9oeLkQRtdKMfD7H3t1OV
 DJAbRQ+aZonDH9eDxivHVSiJlzGZ5VZaW8hLp+0k8NRduYBqSOeesYwUU1BoopLBgd0N
 c0xULVzurqonS3bix5XXvNfo6rsj9elnv/1hOmwPdTRWy22gVbugtWxreAErUzNmgy15
 aGmd9A++mtm9KTXmBd9Bf+kNqH0QCs8qnDDydXcHn1Dy3XpHp2o48ty/knHnocTOBDYB
 E7uQ==
X-Gm-Message-State: AOJu0YxlOdBy5DN4wjOeBUMohTJl5a1cUJY/uGRuLR30VN2P5j5oaR8r
 POeMHjXbS9OHbRnNsgz1U5xn2gr1glXUjwLkwJRLKIbda3hAOlN5g1dk0G8L+hYBNHaumm7RlV1
 glSW3q19tJ6fEw5XOibldRdoTbQFc8gEF0zNltSfuR6C8Obxu+++szGHFNY6ci4l2H48sSsvZMg
 ==
X-Received: by 2002:ad4:5144:0:b0:67a:3863:d126 with SMTP id
 g4-20020ad45144000000b0067a3863d126mr10046199qvq.44.1701187782197; 
 Tue, 28 Nov 2023 08:09:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBKpSSFbtesM/25uZwKIDezsMT1jPt3i9azPNVI4N4TMfmDOkXhoCn8EiGeenreU73yagsK6uZPTXiBRU8kPg=
X-Received: by 2002:ad4:5144:0:b0:67a:3863:d126 with SMTP id
 g4-20020ad45144000000b0067a3863d126mr10046174qvq.44.1701187781933; Tue, 28
 Nov 2023 08:09:41 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Nov 2023 17:09:41 +0100
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <054bbf2a-e7ba-40bf-8f8b-f0e0e9b396c6@collabora.com>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-13-cristian.ciocaltea@collabora.com>
 <CAJM55Z9e=vjGKNnmURN15mvXo2bVd3igBA-3puF9q7eh5hiP+A@mail.gmail.com>
 <2f06ce36-0dc1-495e-b6a6-318951a53e8d@collabora.com>
 <CAJM55Z8vkMbqXY5sS2o4cLi8ow-JQTcXU9=uYMBSykwd4ppExw@mail.gmail.com>
 <054bbf2a-e7ba-40bf-8f8b-f0e0e9b396c6@collabora.com>
Mime-Version: 1.0
Date: Tue, 28 Nov 2023 17:09:41 +0100
Message-ID: <CAJM55Z9+j6CmfjNkPLCk1DR3EBuEMspsRtNvygDbPWJDCytQpw@mail.gmail.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Emil Renner Berthing <kernel@esmil.dk>, Samin Guo <samin.guo@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 12/12] [UNTESTED] riscv: dts: starfive:
 beaglev-starlight: Enable gmac
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

Cristian Ciocaltea wrote:
> On 11/28/23 14:08, Emil Renner Berthing wrote:
> > Cristian Ciocaltea wrote:
> >> On 11/26/23 23:10, Emil Renner Berthing wrote:
> >>> Cristian Ciocaltea wrote:
> >>>> The BeagleV Starlight SBC uses a Microchip KSZ9031RNXCA PHY supporting
> >>>> RGMII-ID.
> >>>>
> >>>> TODO: Verify if manual adjustment of the RX internal delay is needed. If
> >>>> yes, add the mdio & phy sub-nodes.
> >>>
> >>> Sorry for being late here. I've tested that removing the mdio and phy nodes on
> >>> the the Starlight board works fine, but the rx-internal-delay-ps = <900>
> >>> property not needed on any of my VisionFive V1 boards either.
> >>
> >> No problem, thanks a lot for taking the time to help with the testing!
> >>
> >>> So I wonder why you need that on your board
> >>
> >> I noticed you have a patch 70ca054e82b5 ("net: phy: motorcomm: Disable
> >> rgmii rx delay") in your tree, hence I you please confirm the tests were
> >> done with that commit reverted?
> >>
> >>> Also in the driver patch you add support for phy-mode = "rgmii-txid", but here
> >>> you still set it to "rgmii-id", so which is it?
> >>
> >> Please try with "rgmii-id" first. I added "rgmii-txid" to have a
> >> fallback solution in case the former cannot be used.
> >
> > Ah, I see. Sorry I should have read up on the whole thread. Yes, the Starlight
> > board with the Microchip phy works with "rgmii-id" as is. And you're right,
> > with "rgmii-id" my VF1 needs the rx-internal-delay-ps = <900> property too.
>
> That's great, we have now a pretty clear indication that this uncommon behavior
> stems from the Motorcomm PHY, and *not* from GMAC.
>
> >>
> >>> You've alse removed the phy reset gpio on the Starlight board:
> >>>
> >>>   snps,reset-gpios = <&gpio 63 GPIO_ACTIVE_LOW>
> >>>
> >>> Why?
> >>
> >> I missed this in v1 as the gmac handling was done exclusively in
> >> jh7100-common. Thanks for noticing!
> >>
> >>>>
> >>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >>>> ---
> >>>>  arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts | 5 +++++
> >>>>  1 file changed, 5 insertions(+)
> >>>>
> >>>> diff --git a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
> >>>> index 7cda3a89020a..d3f4c99d98da 100644
> >>>> --- a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
> >>>> +++ b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
> >>>> @@ -11,3 +11,8 @@ / {
> >>>>  	model = "BeagleV Starlight Beta";
> >>>>  	compatible = "beagle,beaglev-starlight-jh7100-r0", "starfive,jh7100";
> >>>>  };
> >>>> +
> >>>> +&gmac {
> >>>> +	phy-mode = "rgmii-id";
> >>>> +	status = "okay";
> >>>> +};
> >>>
> >>> Lastly the phy-mode and status are the same for the VF1 and Starlight boards,
> >>> so why can't these be set in the jh7100-common.dtsi?
> >>
> >> I wasn't sure "rgmii-id" can be used for both boards and I didn't want
> >> to unconditionally enable gmac on Starlight before getting a
> >> confirmation that this actually works.
> >>
> >> If there is no way to make it working with "rgmii-id" (w/ or w/o
> >> adjusting rx-internal-delay-ps), than we should switch to "rgmii-txid".
> >
> > Yeah, I don't exactly know the difference, but both boards seem to work fine
> > with "rgmii-id", so if that is somehow better and/or more correct let's just go
> > with that.
>
> As Andrew already pointed out, going with "rgmii-id" would be the recommended
> approach, as this passes the responsibility of adding both TX and RX delays to
> the PHY.  "rgmii-txid" requires the MAC to handle the RX delay, which might
> break the boards having a conformant (aka well-behaving) PHY.  For some reason
> the Microchip PHY seems to work fine in both cases, but that's most likely an
> exception, as other PHYs might expose a totally different and undesired
> behavior.
>
> I will prepare a v3 soon, and will drop the patches you have already submitted
> as part of [1].

Sounds good. Then what's missing for ethernet to work is just the clock patches:
https://github.com/esmil/linux/commit/b5abe1cb3815765739aff7949deed6f65b952c4a
https://github.com/esmil/linux/commit/3a7a423b15a9f796586cbbdc37010d2b83ff2367

You can either include those as part of your patch series enabling ethernet, or
they can be submitted separately with the audio clocks. Either way is
fine by me.

/Emil

>
> Thanks again for your support,
> Cristian
>
> [1]: https://lore.kernel.org/all/20231126232746.264302-1-emil.renner.berthing@canonical.com/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
