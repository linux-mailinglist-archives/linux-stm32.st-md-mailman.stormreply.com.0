Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5745968383
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Sep 2024 11:46:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 601D4C71292;
	Mon,  2 Sep 2024 09:46:44 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A029C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Sep 2024 09:46:37 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5c26815e174so354518a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Sep 2024 02:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725270397; x=1725875197;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uvU0q4IqsZC3m7HbUXvgFdJn7OUlluR4GbPu5ha70so=;
 b=VDQQSfHCJL6zuk6fj6evJ+NPkkC7OTAohmY/NBjyOBTwocdLIE1J1zY7w2tGHqBiCr
 2vWEvpcND8MpOAgFlzZkZY3acVliYl5lXQEYbq/Y8RQcuXnJatTIz69iIuTJF8kIjZh9
 XVGJgEMjdApSXiAnhtsW7Uz7LxLiRQ1nsISQXmHpkan5trHqYfX5xrslZRqBpplYh5V2
 6XlIruFKsDiai9mWyAvXhVAg2qp1mhgqK7PZcKkggEjRX4eAD3KykbsSzxlPIl83AjoQ
 RLmelbETnTfaIyRtYtyiD0xnIImRkyXs7e33Qgnz1It9pKJxwlc9MEj1hYNgx9xi0iVF
 Efug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725270397; x=1725875197;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uvU0q4IqsZC3m7HbUXvgFdJn7OUlluR4GbPu5ha70so=;
 b=ASEX2GcEGEBX23vdWLbmImkSxv61FKaEAG5WLbMtSfXlqIrFc1qOrom5B4VPK1TyPq
 JWj4Jzs2T9+sMHlzeEgHPjKdFUb4+Butc53/i4cW4/6i3FvjmbqFCm72b1iBEKfU+Zrk
 UXIVhGghjXlvEmj5ghUgVzHFDS+5Y2KJc0QsHfycHR9sa0JpPbj0TL6QUEBesfxKQLve
 6eM415dTobYPQW2Qrnj5WVW/X9qKL5VF/i70fM94qAUdzikcCkOgDKE8SSQHIXG4mpV4
 SBjPvLarpCOvs04eaZBSSrBQVaah70zNSGPQTV/ZTS9kHTofNFoniCJzOMzV6SxBzXQI
 YTnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlbpbm6D8ElL48uyaCSb3IubVG71aaA3PORBpBCTBc7SF41cHb4JGB0IYIzy9RXEi6i6QfLGdaEP362g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywb7HjMset6rhpwN1nSGCtSp1mo4WIMbWQylvZCcSGRUfRGeqSI
 Y9nToamG3OjBc4kzv7Ms4+UBGRe2L8V1Dg0H1pyPxznrrs2PnOO+yQwCpojCTCQ=
X-Google-Smtp-Source: AGHT+IH1zg1jlwXDCyd/ampfGvI2tFOVMbwlFkIFwwhxA5YtvJe4GT6oAvCh2TQyWSsKQ+egPE4Erg==
X-Received: by 2002:a05:6402:3481:b0:5c2:112e:f106 with SMTP id
 4fb4d7f45d1cf-5c21ed319c6mr9363383a12.3.1725270396001; 
 Mon, 02 Sep 2024 02:46:36 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b496:9e67:73c9:9f5a])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226ccfeacsm5009357a12.78.2024.09.02.02.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 02:46:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org, brgl@bgdev.pl, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, Shen Lichuan <shenlichuan@vivo.com>
Date: Mon,  2 Sep 2024 11:46:34 +0200
Message-ID: <172527039219.21144.385699965145763717.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240829131051.43200-1-shenlichuan@vivo.com>
References: <20240829131051.43200-1-shenlichuan@vivo.com>
MIME-Version: 1.0
Cc: opensource.kernel@vivo.com,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1] gpio: stmpe: Simplify with
	dev_err_probe()
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 29 Aug 2024 21:10:51 +0800, Shen Lichuan wrote:
> Use dev_err_probe() to simplify the error path and unify a message
> template.
> 
> Using this helper is totally fine even if err is known to never
> be -EPROBE_DEFER.
> 
> The benefit compared to a normal dev_err() is the standardized format
> of the error code, it being emitted symbolically and the fact that
> the error code is returned which allows more compact error paths.
> 
> [...]

Applied, thanks!

[1/1] gpio: stmpe: Simplify with dev_err_probe()
      commit: 1882e769362b8e4ef68fd30a05295f5eedf5c54a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
