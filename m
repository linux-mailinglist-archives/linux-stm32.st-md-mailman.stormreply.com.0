Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D697D7EE4A8
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Nov 2023 16:50:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89B40C6C839;
	Thu, 16 Nov 2023 15:50:27 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82CB2C6C837
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Nov 2023 15:50:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D1AA0CE20CE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Nov 2023 15:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15965C433CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Nov 2023 15:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700149824;
 bh=BolSwldx43V1s8lR3ByoyIMODjpgx8SOOvx2mkBrbUI=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=UF9HIah3VHoLbYth2CTAiD1ubicY+3D8g70w32pOj8EiJBfWgopgAv+aS118WcvSd
 D7MOh9+8VypvhXwQX8ohvQYLcPhvCTYogzjM/RJUefhmFk2hzi+hgq3MiD081Fom4i
 XH1a33/MHR4QzKmupt6urAfAFvX4pn8AbQskBC1CE1gqPAPNSSadHvbyew2Anb6KXO
 Tm9KCx/wJ+y9Hgl8A7/U8BQlpfD8g53pcMErzwqdFJGhO+5lt2FdSF0EjWGPN7A8bW
 IpKruvN8lZK3aXyVB9xtnd33CfwZtqonmfZuuG2RDyIyK8DIexINh0OH1Jr4j6wOSb
 ULZu8Hu6cjEDw==
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-5bd306f86a8so732579a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Nov 2023 07:50:24 -0800 (PST)
X-Gm-Message-State: AOJu0YyjsgTXIvEKIRo0QwbQ/K3N13tljDalnospdkr4mWzhOq+bZVTA
 oR9lHqSfj8gflVnbuCkITgxXABCW4pKQRwCyeOs=
X-Google-Smtp-Source: AGHT+IEMGFlu4SzYQe96Vr6F03Rp/SrNkJGccyxr7tmeveiTXRgztgXi+I4dU+cty9a2FC6wuDTy4PmEvaAETZ2DgJ8=
X-Received: by 2002:a17:90b:1802:b0:280:1c25:b633 with SMTP id
 lw2-20020a17090b180200b002801c25b633mr14521522pjb.2.1700149823613; Thu, 16
 Nov 2023 07:50:23 -0800 (PST)
MIME-Version: 1.0
References: <20231116154816.70959-1-andrzej.p@collabora.com>
 <20231116154816.70959-2-andrzej.p@collabora.com>
In-Reply-To: <20231116154816.70959-2-andrzej.p@collabora.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 16 Nov 2023 23:50:12 +0800
X-Gmail-Original-Message-ID: <CAGb2v64dFzqvvY4BanJ6WO667jFvxaoAX68EACYz7-Byu9i7qg@mail.gmail.com>
Message-ID: <CAGb2v64dFzqvvY4BanJ6WO667jFvxaoAX68EACYz7-Byu9i7qg@mail.gmail.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [RFC 1/6] media: verisilicon Correct a typo in
	H1_REG_ENC_CTRL2_DEBLOCKING_FILTER_MODE
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
Reply-To: wens@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gVGh1LCBOb3YgMTYsIDIwMjMgYXQgMTE6NDjigK9QTSBBbmRyemVqIFBpZXRyYXNpZXdpY3oK
PGFuZHJ6ZWoucEBjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IEl0J3MgYSBGSUxURVIgYW5kIG5v
dCBGSUxFVEVSLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcnplaiBQaWV0cmFzaWV3aWN6IDxhbmRy
emVqLnBAY29sbGFib3JhLmNvbT4KClJldmlld2VkLWJ5OiBDaGVuLVl1IFRzYWkgPHdlbnNAY3Np
ZS5vcmc+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
