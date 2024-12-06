Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDCB9E6386
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Dec 2024 02:45:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47114C78033;
	Fri,  6 Dec 2024 01:45:24 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C769C7802D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2024 01:45:16 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2ee76929a98so1269482a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Dec 2024 17:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733449515; x=1734054315;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+7OGBrM+Ds5/EU59L+lS8dg3ydHTx6BnOQHdjJwv4g8=;
 b=FjY60I4M15vdFSQjgG3EdUUyUCDAYH6YKkAb+UOcM9f70gOMVW02hGE4yl47NJEJ0Q
 oOrtS8q8864dRN+lH3PyNR8aazURBnCLUSk5J12XtA+GlM2wMrxx6SHAyVj7v7i/z5PV
 svEqaGeG8kxCOgXB7jyZHhi9J8/CP5D3DpMaJ/4VMAunXRiAQe/itm3fhGrHaXN8Gh2F
 XBCO1IJdl/s0LtRaKHNYsWJks6Jz9vE1kFyb/an3K2CNxwNUTcHzmMTVYTL63oK/NDvX
 BPEbbMd3xZ1RqgEbdCkgdC5XxnAkkF02+CDCLW0kFdQXm+wDY04LamFsl327njE35wqg
 lqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733449515; x=1734054315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+7OGBrM+Ds5/EU59L+lS8dg3ydHTx6BnOQHdjJwv4g8=;
 b=Q5R5/L5GhDp7Q/Erh7SrsbvhKix/3ZFXZiFQsIG3FYemeRGVJjZJdhjLGkZ+fxI9j4
 LVUZNK7XMpt30F46sW8BijU8xxjaNnCPYxopgnlvNuk4OoSfyFzRDJpkSF5uGTiwjIMR
 8B7o+H8EtAklo+Hfb1jE/WNg7E0s3Fsy06hHt6usevT+kB4BQkv4M5wRXcW+84j48qfM
 /yqFkJ5KE34YR+SsmYkpN233o474rohwxJK3pjEkNy50gaVHhErgWLjb4kP6dKpj3ASo
 DBtgXRrt/jKaIeA3iFefI2vyRCPOExzMoJ+xYzJHAJh0wmbcMfB8r3pxKa0pUgJW1kj8
 7hIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIGJ//Kv3/m5cDl+UeGT3gU1GnsxzKK3esF1N0ClN1Y5K/JyTBF7hwWDUCI/ieE6T2exD9GmB4h4BakA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxE8V+I8C6/9TP/kw/4mHYloBd5rtT41nIh5836MFzi/H/sMJ3T
 Xh5gn4OQRjHODcPhWoK8IK53SvhovysjX8iGaq9TZcFT8Kv9ggik
X-Gm-Gg: ASbGncvmNaB42x72C4ZOpHjtfjTPSwhsYXnBHCZw4VQrbpAqwOo/BzR+YstUk2+5A+s
 r4Maznuv4huyzMd3CS9i3vTKMO+/zaOcoWds17cjQX4VwNQFy1giIypCw7A2cgLq5acj8CUXia3
 NgAl1AcTV56EQLL7RqDb5Pm95TPpz5MEsj+tqmIgtZnUreajzqD6nxW/gRTORFoGH28rPZR28cW
 kQ8wKEZfK6zAlyTDWhCTdQVQB+IKCeKpD6yflMsIQ8OMFk=
X-Google-Smtp-Source: AGHT+IHFjL05H9QqEdxBhvGferOk0PgAeiYGY9/70kKdEA1TFewoP80NXEZbHvZ4XqWoW1SHDKN0wQ==
X-Received: by 2002:a17:90b:3f44:b0:2e2:c2b0:d03e with SMTP id
 98e67ed59e1d1-2ef68d99261mr2300618a91.5.1733449514616; 
 Thu, 05 Dec 2024 17:45:14 -0800 (PST)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ef2708becesm3962772a91.52.2024.12.05.17.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 17:45:14 -0800 (PST)
Date: Fri, 6 Dec 2024 09:45:02 +0800
From: Furong Xu <0x1207@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20241206094502.000062e8@gmail.com>
In-Reply-To: <Z1HYKh9eCwkYGlrA@shell.armlinux.org.uk>
References: <20241205091830.3719609-1-0x1207@gmail.com>
 <Z1HYKh9eCwkYGlrA@shell.armlinux.org.uk>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: Jon Hunter <jonathanh@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v1] net: stmmac: TSO: Fix unaligned
 DMA unmap for non-paged SKB data
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

Hi Russell,

On Thu, 5 Dec 2024 16:43:22 +0000, "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:
> I'm slightly disappointed to have my patch turned into a commit under
> someone else's authorship before I've had a chance to do that myself.
> Next time I won't send a patch out until I've done that.
> 
I am really sorry for this, I should have requested your permission first.

> 
> Please use rmk+kernel@armlinux.org.uk there.
> 
So another iteration is required here.
Would you mind me send the v2 of this fix?
I will not send v2 without your permission.

Thanks.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
