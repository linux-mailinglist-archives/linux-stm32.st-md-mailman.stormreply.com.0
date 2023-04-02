Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0A16D3881
	for <lists+linux-stm32@lfdr.de>; Sun,  2 Apr 2023 16:41:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13CF8C65E56;
	Sun,  2 Apr 2023 14:41:45 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5696C0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Apr 2023 14:41:42 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id t4so21597850wra.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 02 Apr 2023 07:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680446502;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bEt4l1scuvVJz61CdEo1J/wJGcCf7qx7gZaNe6q49Tk=;
 b=AM6IaoRgryD3mDHhYKjzWlGbOI4PjjiEREetuHxrbI8nRCASKBbID1ipXfMppUGefn
 SbRKbLaAy9LbJ3V3mYVh1d7MfKEOcTMaYCQgoi2kIqrA8WieblRhcgfY1lBJy2l7AUzC
 EplF4yW5IeKj4Msbo4Qhegh3MyPtngcY4GgSehJsaeWXcZlkh0ImoFsC1vlwoaBqzZMx
 4vAu5vD81iViSQ0u+6NM9bNpQVITK0e1iinU0lKKuoX3lh/VtVQ8biplLPpVXwfrl8cH
 H+K6jZscXL1FWh8GR95ZawTqsOkOrQbpoOAEwWn6qEyY+R1pr8ctvfOnNibyvJMAgT7h
 KTbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680446502;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bEt4l1scuvVJz61CdEo1J/wJGcCf7qx7gZaNe6q49Tk=;
 b=cIEOJpGDFfnIBmTk9QsX5tIHRTLrOJiMwm8Gj6BwQTopZ83CLi5BhxPRzsFWeUBNf8
 9TAzWVvT5KzXrZKtBFDtuz2DX99Hg0ipI5HsszetSs9w1GkdFYK543M6ev3+Jb+wGiJ0
 /VQjVm4WlFzHGrRjoOwwEOWfxGQ9+vMt26Am1GnAEroMUUbU0SVi1o/lCvmv2mTPadYu
 JP6aVa2maQyLo6Vve0l0Urb73tZta/EH1hcyFOh0AKJWkduKCtquc0sGCMpj+mPJ76Fm
 7yL445kJ+AxEcBtOE55JphxrCv3osTX/xo8hs/YCi4/CMLgswUsorAMMLXgLd0IQ/bnY
 L/UQ==
X-Gm-Message-State: AAQBX9ewrHw1cBYvLIz/ZqiABHts05rz4a16z0sNO7et59+NNsVQeyJf
 x/NlIvohfz89gFxGjvls9Js=
X-Google-Smtp-Source: AKy350Yn72Cp3g4kqSIGRXETjmEUB7dsTtjqD1MDsR7d5+bikqDEJ859bvNTN8XhIC4ugyFr+biBQQ==
X-Received: by 2002:a5d:58e7:0:b0:2ce:aed6:3f2e with SMTP id
 f7-20020a5d58e7000000b002ceaed63f2emr23235081wrd.46.1680446502253; 
 Sun, 02 Apr 2023 07:41:42 -0700 (PDT)
Received: from jernej-laptop.localnet ([209.198.137.155])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a5d4d06000000b002e6d4ac31a3sm5053895wrt.72.2023.04.02.07.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Apr 2023 07:41:41 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Date: Sun, 02 Apr 2023 16:41:40 +0200
Message-ID: <5660915.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20230402143025.2524443-11-u.kleine-koenig@pengutronix.de>
References: <20230402143025.2524443-1-u.kleine-koenig@pengutronix.de>
 <20230402143025.2524443-11-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Cc: kernel@pengutronix.de, netdev@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] Re: [PATCH net-next 10/11] net: stmmac: dwmac-sun8i:
 Convert to platform remove callback returning void
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Dne nedelja, 02. april 2023 ob 16:30:24 CEST je Uwe Kleine-K=F6nig napisal(=
a):
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> =

> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> =

> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

For sunxi:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
