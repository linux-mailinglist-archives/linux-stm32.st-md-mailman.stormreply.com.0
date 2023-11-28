Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A787FB9DF
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Nov 2023 13:08:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 053DEC6B442;
	Tue, 28 Nov 2023 12:08:24 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8DD13C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Nov 2023 12:08:22 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E99383F457
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Nov 2023 12:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1701173300;
 bh=iOZrwSPmspp94JeIuHB4gK1Gx/cQjCpWhXKzSprsIjI=;
 h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=VQLQBAN4YG5XHNUd4xirdtm8AH2zg/dLJCcXXp1I8V+0L8qg6I0h8NwFv0KukYsDu
 l7KHftmvHdL+Q3rTg3sqkFbOkXR2WVgba3iZ0eKUTMvmz8ZbiXeZyE7JteKPoIJuZT
 gPQLqYakJrHR6hUFJorxdJgSbi4MHrlJq4zFEkMBT6lT0x41rOVfKdX00lRBa5Rdao
 y6PLnG7q//lNknuFk8K1ilqKxiKh2We9s7ul2kXu9pI45Z3M/yvtJ5E7tqcIQXEEGm
 TlaQMFq8LYdnex485YMNlATxe6nWNaxiMikt/KeK17dpdTawGkU8JNy8a4h5R28T47
 vG3zi0mTe7jqw==
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-77dc7cf66cdso466885a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Nov 2023 04:08:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701173300; x=1701778100;
 h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iOZrwSPmspp94JeIuHB4gK1Gx/cQjCpWhXKzSprsIjI=;
 b=XhvAR+DrgcSfH9NbfbSuNprNXVwjSC3i9wTPsvpCPdjWx+LBUMZS7IsrYU3akICu2z
 4hgmYjSYG5rspIvBGvSEYp6tdOMMCgCoQTXpQDylxFIdi1ZLEbcSPGJYlsRj89nQMyQg
 pLgIl7LO6hNGEwJ+vP0PI9qsLfmNxdQnuOY2wzeWuK2SL1xHbhi0IdOi4Njf+dTBrL0H
 vQ4EmUvgvOAQdm4tc7mjs1tQlZ73SxfjoQJHsAlX4sNRn4H2kNkaB21HQqThCsQAVmlA
 1yPpuFN8J/gIHta3njGj9K7+fIh/nk88/XWd10FPAIvpN7u/Qkl5H8Y+Sjtfquiz61Mb
 f4mA==
X-Gm-Message-State: AOJu0YzEZb8BmqB6Qwx2HOyIx6t6DGj7BldeLXMhcWd0BfD8Snfw5VDD
 2FBk0nbzJe2CVXofaQi2S9gVrQvq24wMonK2XNihTxh6xih6yfqeKDIBaVbU6Uho9C/gkzFxLLA
 EHeLkk5iMf5K2t3Pcq+iGsQ/YYzzTHwcnj/Jm7ekjhj7MBVyGDcpmlLMuMCImQ09kVF17IGYqFA
 ==
X-Received: by 2002:a0c:c788:0:b0:67a:4bb0:693a with SMTP id
 k8-20020a0cc788000000b0067a4bb0693amr5088391qvj.55.1701173299931; 
 Tue, 28 Nov 2023 04:08:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBEBEjzW+Uph8+AZgkvAUsq8GnJE2nUXrDjraYHJF2flj0Zg8LkQf+0YqL9hF83A1yoS4DqWVvh0w1JaGFdxE=
X-Received: by 2002:a0c:c788:0:b0:67a:4bb0:693a with SMTP id
 k8-20020a0cc788000000b0067a4bb0693amr5088373qvj.55.1701173299631; Tue, 28 Nov
 2023 04:08:19 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Nov 2023 13:08:18 +0100
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <2f06ce36-0dc1-495e-b6a6-318951a53e8d@collabora.com>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-13-cristian.ciocaltea@collabora.com>
 <CAJM55Z9e=vjGKNnmURN15mvXo2bVd3igBA-3puF9q7eh5hiP+A@mail.gmail.com>
 <2f06ce36-0dc1-495e-b6a6-318951a53e8d@collabora.com>
Mime-Version: 1.0
Date: Tue, 28 Nov 2023 13:08:18 +0100
Message-ID: <CAJM55Z8vkMbqXY5sS2o4cLi8ow-JQTcXU9=uYMBSykwd4ppExw@mail.gmail.com>
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
> On 11/26/23 23:10, Emil Renner Berthing wrote:
> > Cristian Ciocaltea wrote:
> >> The BeagleV Starlight SBC uses a Microchip KSZ9031RNXCA PHY supporting
> >> RGMII-ID.
> >>
> >> TODO: Verify if manual adjustment of the RX internal delay is needed. If
> >> yes, add the mdio & phy sub-nodes.
> >
> > Sorry for being late here. I've tested that removing the mdio and phy nodes on
> > the the Starlight board works fine, but the rx-internal-delay-ps = <900>
> > property not needed on any of my VisionFive V1 boards either.
>
> No problem, thanks a lot for taking the time to help with the testing!
>
> > So I wonder why you need that on your board
>
> I noticed you have a patch 70ca054e82b5 ("net: phy: motorcomm: Disable
> rgmii rx delay") in your tree, hence I you please confirm the tests were
> done with that commit reverted?
>
> > Also in the driver patch you add support for phy-mode = "rgmii-txid", but here
> > you still set it to "rgmii-id", so which is it?
>
> Please try with "rgmii-id" first. I added "rgmii-txid" to have a
> fallback solution in case the former cannot be used.

Ah, I see. Sorry I should have read up on the whole thread. Yes, the Starlight
board with the Microchip phy works with "rgmii-id" as is. And you're right,
with "rgmii-id" my VF1 needs the rx-internal-delay-ps = <900> property too.

>
> > You've alse removed the phy reset gpio on the Starlight board:
> >
> >   snps,reset-gpios = <&gpio 63 GPIO_ACTIVE_LOW>
> >
> > Why?
>
> I missed this in v1 as the gmac handling was done exclusively in
> jh7100-common. Thanks for noticing!
>
> >>
> >> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >> ---
> >>  arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts | 5 +++++
> >>  1 file changed, 5 insertions(+)
> >>
> >> diff --git a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
> >> index 7cda3a89020a..d3f4c99d98da 100644
> >> --- a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
> >> +++ b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
> >> @@ -11,3 +11,8 @@ / {
> >>  	model = "BeagleV Starlight Beta";
> >>  	compatible = "beagle,beaglev-starlight-jh7100-r0", "starfive,jh7100";
> >>  };
> >> +
> >> +&gmac {
> >> +	phy-mode = "rgmii-id";
> >> +	status = "okay";
> >> +};
> >
> > Lastly the phy-mode and status are the same for the VF1 and Starlight boards,
> > so why can't these be set in the jh7100-common.dtsi?
>
> I wasn't sure "rgmii-id" can be used for both boards and I didn't want
> to unconditionally enable gmac on Starlight before getting a
> confirmation that this actually works.
>
> If there is no way to make it working with "rgmii-id" (w/ or w/o
> adjusting rx-internal-delay-ps), than we should switch to "rgmii-txid".

Yeah, I don't exactly know the difference, but both boards seem to work fine
with "rgmii-id", so if that is somehow better and/or more correct let's just go
with that.

Thanks!
/Emil

>
> Thanks,
> Cristian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
