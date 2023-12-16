Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 834E5815B47
	for <lists+linux-stm32@lfdr.de>; Sat, 16 Dec 2023 20:24:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18E98C6DD6B;
	Sat, 16 Dec 2023 19:24:44 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 630FEC6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Dec 2023 19:24:43 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B17173F2C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Dec 2023 19:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1702754682;
 bh=arp4KgnNalvlcscGqi/VgrS8JYrKrYTVbwSx1z/f2Zk=;
 h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=iscJyetlYx/Qnbmo/VkOHDYJiCr4Rk8y/rSSWRPM/rY61Og3jIV6/7uBwigcl8MsO
 nEh1GHEqwlbBs9B+EMeRoFZiGLe/23dIWe0Bt2o0mReBGGkHQYap0cNVByxdnc+34T
 h+EQOsZLiewz3AMDlS0z8NoYPv+MQTVijewBcp4PzNDh0HHueJkQssF8moXHX8o5eC
 8C711SnZsGtXNF7Wy8UR1dZ8YDwUp3X1QYK+Eyvb/xZ2E25GE2Hj3Bq5sfVVgZ1xQ3
 JzKqk2z4sTzvWQl/s7n/Wp8SsYk1vGvyI+zOUTjy5iif0RoJDF9iodY/x3Jn+B5/Mm
 HhCVXkepkTWPg==
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-425a6272642so33186651cf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Dec 2023 11:24:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702754681; x=1703359481;
 h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=arp4KgnNalvlcscGqi/VgrS8JYrKrYTVbwSx1z/f2Zk=;
 b=posELCvjJ5NvpdgFg83Cud7eS42boxF2oEbAnSW2x4/XSd7BjDKWR54tbkMKRlLrrj
 lDGgS3AsqVYSrRrxdJFbyJYjTY0YlFMvrsVFARkwPXXtTYxAmmEuOR9qdZ5FuRe7jB5H
 SXYlsLOS+04jU7vK6KQcJtso9sMkLmukTX8TthVErS8Ugnlb7rw/xOPds28963mqL9BD
 rgDYgmQ8SFVNqAE4sEFVNCChFWTy1p6dwegP1F+xTbDV2PJpwPH0q2ELd2WRGUkL7Uom
 bwGmPNK5rSgY6SF8ElqupOgs2EJDAJwhwHvKaZq5ET/MmrvvFbxvt0h58jyA/nIdNUeT
 3khA==
X-Gm-Message-State: AOJu0YzdX4at1MBXD0FVabuVTBpflkDFnTPJsTvKkJ4B3rkcR2OnHb21
 dtDHR6akWHpgGyG9WVrojitdbOu5ZY1aWbskMjKLXAS/lULMy8L2WefvFS4JDYRB6w01fllJUEg
 nJzUUNEkHHjB643RD6Dk724UGRzH1SZGB1Hp1PgVUFFHCvo/8Shrnbr63WRkbw8n3JzR+q6BvYw
 ==
X-Received: by 2002:a05:622a:1cf:b0:418:1565:ed50 with SMTP id
 t15-20020a05622a01cf00b004181565ed50mr17632942qtw.66.1702754681674; 
 Sat, 16 Dec 2023 11:24:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHh1FB45qk7mcuI2qHGO1vj4JgeCLK0ZvhpRnKj5MhPIcHzu1iD+2wJffax6hiqvMJOiTseak4ew2mkMkdlIE8=
X-Received: by 2002:a05:622a:1cf:b0:418:1565:ed50 with SMTP id
 t15-20020a05622a01cf00b004181565ed50mr17632917qtw.66.1702754681432; Sat, 16
 Dec 2023 11:24:41 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 16 Dec 2023 11:24:40 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <698fbb5d-0750-4f2a-857f-5429e5f589f9@collabora.com>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-13-cristian.ciocaltea@collabora.com>
 <CAJM55Z9e=vjGKNnmURN15mvXo2bVd3igBA-3puF9q7eh5hiP+A@mail.gmail.com>
 <2f06ce36-0dc1-495e-b6a6-318951a53e8d@collabora.com>
 <698fbb5d-0750-4f2a-857f-5429e5f589f9@collabora.com>
Mime-Version: 1.0
Date: Sat, 16 Dec 2023 11:24:40 -0800
Message-ID: <CAJM55Z-e8mkjac-nCF9_w6EmMVbL9ued0mAcjwTMF=pKDLkMsA@mail.gmail.com>
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
> On 11/28/23 02:40, Cristian Ciocaltea wrote:
> > On 11/26/23 23:10, Emil Renner Berthing wrote:
> >> Cristian Ciocaltea wrote:
> >>> The BeagleV Starlight SBC uses a Microchip KSZ9031RNXCA PHY supporting
> >>> RGMII-ID.
> >>>
>
> [...]
>
> >> You've alse removed the phy reset gpio on the Starlight board:
> >>
> >>   snps,reset-gpios = <&gpio 63 GPIO_ACTIVE_LOW>
> >>
> >> Why?
> >
> > I missed this in v1 as the gmac handling was done exclusively in
> > jh7100-common. Thanks for noticing!
>
> Hi Emil,
>
> I think the reset doesn't actually trigger because "snps,reset-gpios" is
> not a valid property, it should have been "snps,reset-gpio" (without the
> trailing "s").
>
> However, this seems to be deprecated now, and the recommended approach
> would be to define the reset gpio in the phy node, which I did in [1].
>
> Hopefully this won't cause any unexpected behaviour. Otherwise we should
> probably simply drop it.
>
> [1]: https://lore.kernel.org/lkml/20231215204050.2296404-8-cristian.ciocaltea@collabora.com/

Oh, nice catch! With your v3 patches the Starlight board still works fine and
GPIO63 is correctly grabbed and used for "PHY reset".

/Emil
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
