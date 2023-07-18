Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 466F87577F2
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jul 2023 11:27:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBD79C6A611;
	Tue, 18 Jul 2023 09:27:19 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9713C6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jul 2023 09:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689672437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z0vyMeOfw7fSC/qxKnZBBj+xlz8lL8pZMksMNnnuzCg=;
 b=Q2+7fGF0YkjJPjxBfiXUIFkyFK5IRcBIC8/xhlL+kpaCbfiCSxwWapD7JXhNS7srOtvUqS
 idSrC9/xzjOeMZ/M8q6XgyTv9hMgFnvyY/sllrd8LeFgIm4k5nuBQ93iP4SiKvPFB6UUz+
 ZN478OsyWDXLgMv7hDKdnoKQ5HpMCPE=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-C_uY29G4P7-0OcSzkXJWXQ-1; Tue, 18 Jul 2023 05:27:16 -0400
X-MC-Unique: C_uY29G4P7-0OcSzkXJWXQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4032a3ad8c0so8395391cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jul 2023 02:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689672436; x=1690277236;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z0vyMeOfw7fSC/qxKnZBBj+xlz8lL8pZMksMNnnuzCg=;
 b=aVhGxvqUuU9YzBdnvC7Axyhg8ipjyjlXP58isNdpGAV62MCIxaSxnqndJ1T8Wo1rzE
 S6Z2jTA8+pb5+lm6pk/P3wFq0hZN+Cy43DQf3O7nqthzG57mE81BylDqvt727BauCnDF
 AYWcdmH+V+Mj+JFYYH/aS6HcoslG0bOyjUvGiO9D+uq/v3Gy7Y0HN8idHGbAEe4nHq4m
 4bHyhX9trMTGCfhigeQNsWNASmv2LSVyansdQHR8M1Xv9hmZcaPgMwN9yFGqSUDrR5Hr
 q9fWQpYtc6GhQM4nrgqnvTGjfhqkSk8OA8bv8vp6+Cvie3OpRK+9se9KuWRyMqHr6Ulv
 /msQ==
X-Gm-Message-State: ABy/qLax1H1wS+PLmysnKHiUDDQbbhQzl1MX5cm2XhbHVGKPPWijFxFu
 6q725oix0Bcf8AT1Ss4uUey5+aHlTGrI2l/Igu7HJJS0vWcjIEZsH6i+5RPaoSzShj0LFisHsFs
 a/We+/cPVUUbiXZ+8tbVnHLlLO7Ia/mzvdkjPZ2KQ
X-Received: by 2002:a05:6214:509d:b0:63c:7427:e7e9 with SMTP id
 kk29-20020a056214509d00b0063c7427e7e9mr12261349qvb.6.1689672436182; 
 Tue, 18 Jul 2023 02:27:16 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFYFNw7x3jThmvZICEe6iXFu0qG+zQql7vEpRKMvc0qVPxJUK7o8zW+ji84Z85dUEkIw+qD2g==
X-Received: by 2002:a05:6214:509d:b0:63c:7427:e7e9 with SMTP id
 kk29-20020a056214509d00b0063c7427e7e9mr12261327qvb.6.1689672435965; 
 Tue, 18 Jul 2023 02:27:15 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-226-170.dyn.eolo.it.
 [146.241.226.170]) by smtp.gmail.com with ESMTPSA id
 h10-20020a0cf20a000000b00635fc10afd6sm592785qvk.70.2023.07.18.02.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 02:27:15 -0700 (PDT)
Message-ID: <ee31215ededd386eba19fb62b0de8d0bad78d687.camel@redhat.com>
From: Paolo Abeni <pabeni@redhat.com>
To: Alex Elder <elder@ieee.org>, Rob Herring <robh@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,  Alex Elder <elder@kernel.org>
Date: Tue, 18 Jul 2023 11:27:10 +0200
In-Reply-To: <1c6175fc-496a-843c-c8c5-2173e065eaa8@ieee.org>
References: <20230714174809.4060885-1-robh@kernel.org>
 <1c6175fc-496a-843c-c8c5-2173e065eaa8@ieee.org>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 ath10k@lists.infradead.org, linux-can@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-wpan@vger.kernel.org,
 linux-mediatek@lists.infradead.org, ath11k@lists.infradead.org,
 wcn36xx@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-oxnas@groups.io,
 linuxppc-dev@lists.ozlabs.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: Explicitly include correct DT
	includes
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

Hi,

On Sat, 2023-07-15 at 10:11 -0500, Alex Elder wrote:
> On 7/14/23 12:48 PM, Rob Herring wrote:
> > The DT of_device.h and of_platform.h date back to the separate
> > of_platform_bus_type before it as merged into the regular platform bus.
> > As part of that merge prepping Arm DT support 13 years ago, they
> > "temporarily" include each other. They also include platform_device.h
> > and of.h. As a result, there's a pretty much random mix of those include
> > files used throughout the tree. In order to detangle these headers and
> > replace the implicit includes with struct declarations, users need to
> > explicitly include the correct includes.
> > 
> > Signed-off-by: Rob Herring <robh@kernel.org>
> 
> (I significantly reduced the addressee list to permit the message
> to be sent.)
> 
> For "drivers/net/ipa/ipa_main.c":
> 
> Acked-by: Alex Elder <elder@linaro.org>

The patch does not apply cleanly to net-next. Rob, could you please re-
spin it? While at that, have you considered splitting it in a few
smaller patches (e.g. can, dsa, freescale, ibm, marvel, mediatek,
stmmicro,  sun, ti, xilinx, wireless, remaining)?

Thanks!

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
