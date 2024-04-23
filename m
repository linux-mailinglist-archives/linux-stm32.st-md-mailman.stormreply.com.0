Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E60868AE7F8
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Apr 2024 15:22:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C8C6C7128A;
	Tue, 23 Apr 2024 13:22:19 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D3E4C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Apr 2024 13:22:17 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-56e48d0a632so8401461a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Apr 2024 06:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713878537; x=1714483337;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1n7JSfYWxQy0YOfnlGRtbUocgojCIv1pFKvACUA3fEs=;
 b=wgGDQlB+tGTKpSUFoHfvq7AAoNtlduYYtz1Z0TCrwxwQGVgBoo1Oeeu8JtyoG6C6LE
 icPxfCejsjdNBzQGEQn2UaveR6X4TuIUr0Pg3Gi2Mql2uPPWPJljIzij4OjgGDectfLK
 2DtmCaqUeNVfC4zpxqB21mxhcPAsdliZ04rK4G8WXQEY13Vezydi6p85gofaAecR4431
 HBHJBprdQ7dlJaXbu8pgAQHFmb71ftzuwfpCeGsx8VmbwRPRK9X10EnSZoV2BNSJUPBq
 geruh8S01bhf4j63VAvtaK/yPyH9OrQai4bAMDvp9XkOWllBo+DJ/59xCBBJJwwT7Mgw
 teag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713878537; x=1714483337;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1n7JSfYWxQy0YOfnlGRtbUocgojCIv1pFKvACUA3fEs=;
 b=WKN8etYJ8ROhmC44B8HvgTxAg6SOiP4cXdDakwX55nt+M4mj3m1WWbb+SbgLX/WEoi
 37NSIsshZoYHoTL/F66q7/GzzU6USlrnm1EyUApp9BZKvV6wjMaloGmfxPHIf8JdOFP0
 w9KN9ssdUVnhBwAc3UMzCOORIRV6Bq2iU7KZ+xwTC6knvDQSiCk6EG/S4IbbxA3CvS9K
 Wlavj4U+qJM1ufmFOXFnEk9tQSg+6owMErJXcTF0Se+1iIW6d/3+gYYeNCfvedQGlWeG
 Xgyd7PjqTRu2+SckHiUfVIAy90lapYBPZhorld2LTeMzFZqDkdzByZwUFja0wQZhCU5I
 xNKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLz9dOkU6ja0H0ejz94291C+svqMaAzKhfdrKklmPwazDDjGRCllx5iDCzQzatloOx4fdQXP0++dR7lOM1fDcJpycmMP9sBDUspIsWruqwINi4Ljop8CR0
X-Gm-Message-State: AOJu0YwUaCJYFwwHtoqJc2REryaU44MuPNaWg2BJxSEDyDeFiQbYI0yI
 kyH4LLLrRyCUAhdYpzOMGJksGiXBklt9fQSV2IlyiUEkuJ78qXQlu4gNfUsCxxA=
X-Google-Smtp-Source: AGHT+IFQefJU7h8rb4dkLhhIb7FlpFabv8pybeKyFHMNkkIFmzd0O8xUj7u39jSEp0mSnynBk1GipQ==
X-Received: by 2002:a17:907:1115:b0:a58:7ea5:c49b with SMTP id
 qu21-20020a170907111500b00a587ea5c49bmr1872927ejb.42.1713878536780; 
 Tue, 23 Apr 2024 06:22:16 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 w23-20020a170907271700b00a556f2f18d6sm6980541ejk.57.2024.04.23.06.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 06:22:16 -0700 (PDT)
Date: Tue, 23 Apr 2024 16:22:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <cf050593-44c2-4b4b-8198-215455c630f9@moroto.mountain>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-11-477afb23728b@chromium.org>
 <d13fd47e-1ecd-4aa8-844b-cd260e9fa437@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d13fd47e-1ecd-4aa8-844b-cd260e9fa437@linaro.org>
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
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [Linux-stm32] [PATCH 11/35] media: s2255: Use refcount_t
 instead of atomic_t for num_channels
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

On Tue, Apr 23, 2024 at 01:43:49PM +0100, Bryan O'Donoghue wrote:
> On 15/04/2024 20:34, Ricardo Ribalda wrote:
> > Use an API that resembles more the actual use of num_channels.
> > 
> > Found by cocci:
> > drivers/media/usb/s2255/s2255drv.c:2362:5-24: WARNING: atomic_dec_and_test variation before object free at line 2363.
> > drivers/media/usb/s2255/s2255drv.c:1557:5-24: WARNING: atomic_dec_and_test variation before object free at line 1558.
> 
> Hmm, that commit log needs more detail.
> 
> "Convert from atomic_t to refcount_t because refcount_t has memory ordering
> guarantees which atomic does not, hence the WARNING for the free after the
> atomic dec."
> 

The memory ordering rules are the same.  They're basically identical.
The difference is that if you decrement a refcount_t past zero it will
trigger an error and refuse but atomic_t will merrily keep decrementing
forever.  With refcount_t you can still have a use after free bug but
afterward the double free will trigger a warning.

There are time where people use atomic_t to get unique number and don't
care about wrapping so that's fine.  But if it's reference counting then
use refcount_t.

There wouldn't be a Fixes tag in this case, because hopefully it's just
hardenning and not a bugfix.

regards,
dan carpenter
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
