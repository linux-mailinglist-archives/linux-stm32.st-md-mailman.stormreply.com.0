Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CB25F56BB
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Oct 2022 16:51:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 717E3C63327;
	Wed,  5 Oct 2022 14:51:41 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE334C63324
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Oct 2022 14:51:40 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id c2so3145019qvo.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 05 Oct 2022 07:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QmwHGbQvoaY/TFnVnQHLYh+/HcbN2RGXwWhx0V1Vk9k=;
 b=gjopUXWEZ2d4VoVGBtuZoCBUSvJH7WREhR7WR11jhtntHE3SQQYlg/x+6wrvTAsJk3
 93Dt9/jOsZvODxZQWIAtUjtuxTMNcyRXOIPqh3i55auTjpzoenFBT10IO2RsBbcZg4uf
 TGegROqwPPIW+Y0Tr2AvjculHSsduUoLV0KrXTZ5spN2ysXOoBkvCiMq+SG8vZubKacr
 Ef1Vm7XastiLJF64He8wgSpm+vCXqZoRYbJSXZjmBulauTHPSOVhQs9HakuQxkIxNLgH
 buZzpSBeNthrzb+PE/CuX7ioHIcgh5H1ztahj01c55VwIKbGozfWztmYNff5UFEkrj3u
 iTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QmwHGbQvoaY/TFnVnQHLYh+/HcbN2RGXwWhx0V1Vk9k=;
 b=8Ky2OSbDeolwtWDLawXZaJNZSATWDr1Kl3Q8iQbEf/Vox3DScxOklT7zCEC4zJg1i+
 tS9Fs7/nEj8Fwtxu9A2ykePQR48RZXqtywAC00P6jBlOQ9K4A6tVpR18ASfRcAk0YNKp
 FPoYzSlMvqwZkYpXhCve6p6+MPjXwHMKV6RwpebdS+c9kuREXfeeZL1c2S66Jr3BvbWo
 2LxQqHOaskqvnvhl6BKuvp1TlzV4+AA438caT4hFzFhGGwQtOueYhjPO9ISAS1LF1yrr
 gsw59zytstOoedMTm4zVQJ3nXRzYwYjSG7wQSa74IXdYA4O5oALOoPP4S2khQ2Vp8775
 LK8g==
X-Gm-Message-State: ACrzQf3pNU649Yq+9U3SC6CogcNdO2f9/3A33GfoyMAGeyKXdVHVzJFU
 6O5Utz3YvVDi5uq/Y2jXoxU2mkbtUUhKR+Rzt38=
X-Google-Smtp-Source: AMsMyM6jPYkeTeR2NY0nznahmo00ZU8+Sz3HtZuQGhqi/KV6Ys61YV9lrpQewAzLs9fbvppOY7Z7IWcq3tpVk+eMeBs=
X-Received: by 2002:a05:6214:19cf:b0:4a9:4241:2399 with SMTP id
 j15-20020a05621419cf00b004a942412399mr121185qvc.64.1664981499641; Wed, 05 Oct
 2022 07:51:39 -0700 (PDT)
MIME-Version: 1.0
References: <20221005133120.50483-1-olivier.moysan@foss.st.com>
 <20221005133120.50483-2-olivier.moysan@foss.st.com>
In-Reply-To: <20221005133120.50483-2-olivier.moysan@foss.st.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 5 Oct 2022 17:51:03 +0300
Message-ID: <CAHp75VdVfs-e-HGSRejm4c07A_4KuUGSFNvYTtjLC+3JtuhkEg@mail.gmail.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Wan Jiabing <wanjiabing@vivo.com>,
 linux-kernel@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, nuno.sa@analog.com,
 Paul Cercueil <paul@crapouillou.net>, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 1/8] iio: adc: stm32-adc: fix channel
	sampling time init
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

On Wed, Oct 5, 2022 at 4:36 PM Olivier Moysan
<olivier.moysan@foss.st.com> wrote:
>
> Fix channel init for ADC generic channel bindings.
> In generic channel initialization, stm32_adc_smpr_init() is called
> to initialize channel sampling time. The "st,min-sample-time-ns"
> property is an optional property. If it is not defined,
> stm32_adc_smpr_init() is currently skipped.
> However stm32_adc_smpr_init() must always be called,
> to force a minimum sampling time for the internal channels,
> as the minimum sampling time is known.
> Make stm32_adc_smpr_init() call unconditional.

The lines are quite different by their lengths. Are you sure you sent
the updated version (see also below)?

> Fixes: 796e5d0b1e9b ("iio: adc: stm32-adc: use generic binding for sample-time")
>
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>

I have told you already that the tag block doesn't tolerate blank lines.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
