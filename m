Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 931908B56EC
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2024 13:39:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D32AC71285;
	Mon, 29 Apr 2024 11:39:45 +0000 (UTC)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
 [209.85.221.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E74EC71282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2024 11:39:41 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id
 71dfb90a1353d-4de8d12481bso1040714e0c.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2024 04:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714390780; x=1714995580;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=05L08pI3kBTDsTqcTJqQ2PruWVHcpez2K/eYqwLWDm0=;
 b=cbZcDZofxUJkSIcrLVX9MXP+ve8cVKB5Wb841LYgxoVzb+j2E7CMcmgfZbZRWr8wX+
 MXzb8Ia9R0sx/rsB8J62Frh5J+f5Q9jVKguJGwHyKIXDex9ccgpfjx50wnQ0XfIyVPKi
 HNHzj3dTTkJ44f9SVsSBwPd03TDq9A/DDMNZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714390780; x=1714995580;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=05L08pI3kBTDsTqcTJqQ2PruWVHcpez2K/eYqwLWDm0=;
 b=qVCE+4aRwFNlVFD23PuWcwceYBhimHfSXBTtHdW6e3EU5xBNTEnv6YBPmLMjMrPXEg
 DJd6H7d+2hUb7Npf20ScJoEphcS8ghkxYH70T+OrqM4KBpxucO7k7JIUMHLPBQ16m65F
 OaRJNyNsiv1cbxOwLTUg6BIm7ItmzVtcNQlp+6OWJrs7KNsQBwNymV7CCmOdrJ0VhHYj
 Bp3Iel4pJGMxZlKIO3kZXtXlOScGdPNIpjaufjGN2EJDp8fpH9eLOPWJr7AX+HI+aQxw
 L8Q/tSuvfWa+HSmUk+L9S61UQr8JMmDU+HbsOycJxMbAXgT1mOMioJutN/zs0BqPdPME
 h0+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtTOQDuEY6Bp90oiFzG73oD8015VCzDZhXpgEyKGVbEZck/puajPiev6JgabZRrigofkWOog5P9s55RHWmxTCrXGTEJ/zy1Mx6FGut+kOzGl6FZ3VQnNfp
X-Gm-Message-State: AOJu0YzsC+FsdUC2LJkngH1yhmuJy9mXhApS7+4nt50QsIFMGVkS509e
 kxB/7UA/JVo3q+/NizI+b9FA5m2dMZe/GDvXbBHWYe75wQs4jejN3ptLh77uQ+Zk1cYIcyzYHgM
 =
X-Google-Smtp-Source: AGHT+IHLHQZW0brS+HBUABZrpzxBHbIt5dhop/g7aN4RDY05Xh4Rmvety5JXp9Ygm5l+yK11ePVU9g==
X-Received: by 2002:a05:6122:2517:b0:4da:ac09:94d3 with SMTP id
 cl23-20020a056122251700b004daac0994d3mr7838157vkb.6.1714390780416; 
 Mon, 29 Apr 2024 04:39:40 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com.
 [209.85.221.174]) by smtp.gmail.com with ESMTPSA id
 n186-20020a1f72c3000000b004d348293090sm3883720vkc.8.2024.04.29.04.39.40
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 04:39:40 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id
 71dfb90a1353d-4dacb2ad01dso1049956e0c.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2024 04:39:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVlYd/rJpJtcL//7vQLGRl0iRQ86/QlU4YoLrV7GImbBMd4CEQ9r33aMzO+o0yJgcXw6XMnJgRQbf13YSAnHibjzm0UF60moDS3BjhkupGRABQ6iPM7K9rw
X-Received: by 2002:aca:f1a:0:b0:3c8:39b2:bd8b with SMTP id
 26-20020aca0f1a000000b003c839b2bd8bmr7165395oip.55.1714390759097; Mon, 29 Apr
 2024 04:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-23-477afb23728b@chromium.org>
 <97f51ae8-6672-4bd4-b55b-f02114e3d8d0@moroto.mountain>
 <7a8d403b-8baf-4eff-8f9c-69cdcb8b2180@moroto.mountain>
 <9ba7f4e6-2b8b-44a3-9cac-9ed6e50f1700@moroto.mountain>
In-Reply-To: <9ba7f4e6-2b8b-44a3-9cac-9ed6e50f1700@moroto.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 13:39:03 +0200
X-Gmail-Original-Message-ID: <CANiDSCsCpE55_huYq1BchDCR88O3FWRYBGYwA00o01ZdZeL3NA@mail.gmail.com>
Message-ID: <CANiDSCsCpE55_huYq1BchDCR88O3FWRYBGYwA00o01ZdZeL3NA@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Dmitry Osipenko <digetx@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Sergey Kozlov <serjk@netup.ru>, Samuel Holland <samuel@sholland.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-staging@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-sunxi@lists.linux.dev,
 linux-media@vger.kernel.org, Abylay Ospan <aospan@netup.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 linux-mediatek@lists.infradead.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [Linux-stm32] [PATCH 23/35] media: dvb-frontends: tda10048: Use
	the right div
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

Hi Dan

On Tue, 23 Apr 2024 at 11:55, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> Btw, here is the output from my check (based on linux next from a few
> days ago).  There are some false positives because Smatch parses
> __pow10() incorrectly etc but it's mostly correct.

This looks pretty cool :)

Are you planning to add this to smatch soon?

Thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
