Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 109B3BA3D9F
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Sep 2025 15:20:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A84E4C3FAD9;
	Fri, 26 Sep 2025 13:20:37 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2EF8C3F95E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Sep 2025 13:20:35 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-912d4135379so13325139f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Sep 2025 06:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758892834; x=1759497634;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=exD+n9lmOs/QC0XvF7bmTazq5rd7UWP/ET+yH1yUt9w=;
 b=nOSZmmYGDrvAr/Xz9phxI+QjnhDDvCqHTsXBkdG2NFSGz199d/PR3JHFUdWODwOLbP
 Dg2KB7ffqLE3FvYQdFHpc/GbRlaAUEFogfhQzC6A/8n2whkwv4gw9OZdYfrVUPeZKzwS
 NDe7z6COKw20G2JRLOzjQoQ5L340YaaY48DRJVUKgFUzICPDc1tnuE91n46fmMZ9pU7S
 jIvW4AoiuaFY33iXlFZn+gdvD5+jP4kd+WoH7e/GEdH2e0mqcd9W3YeOdAhUB7yiNE2O
 mVbTgnMFJEMlQZ1F2v+XolMBaF4RAheujt2fx7YUPzWJ1h4eoob/4I94Uiz/nAay6mTG
 Li5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758892834; x=1759497634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=exD+n9lmOs/QC0XvF7bmTazq5rd7UWP/ET+yH1yUt9w=;
 b=MmP5Y0OixPu+Kmwrfhq2niTs1UpNvgn8fxfPiEB7BHtuWgACVldhPU9yKAGb3bifCt
 FbHvx6m/EXmr24DC7DDFICw4UpKIFLfbxLeQmb5YxIALdY1MZCi0TyUwaZi+7Df5eOit
 2OS7rLk6Ge7tyjiHoxzEAuQNi6gIQYhA8UkXJqgw+pOsYrhvNiJwyq5cl5RMZ1MvqON5
 m8Xklia90YiKT5m925XRRmdeSfbS0paAMEeGw3RLgC3dkaMQ67SlL9Qp9VF9vMZg4NBx
 8tQdl2DtRMvPYpu8LG4AQjn03/HhMQH6t4nK8dDUxHixuUxwTCO4kLNhR/U7FFRRqPRe
 znRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJMxvrg1Rqssr+bvKql104fQWqIph+ORoZ8vC93zbKkxeta/vrMVb07SAG7bgqJr16+TmW1P+tJ+1DDQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzMSE5aOXVHm1cckh/H8Kd2w4pftaEoaYjUOQL065u/JAk5oTHv
 W6hGxnjPDSpiCjThcoQId3ZJFlHbTJTYw2niJaqdMp131o7XMGr4vAKN
X-Gm-Gg: ASbGnct14I4m4Kv7gcVjPS9FqTeP73U2tqvSCqZGgGC0AAqR7ARWNu12B4436Hq5LFQ
 LNThfoJi3+Uj6u/317pr10BaRvG7197ulFtrCK2lD3xTRLryAleW6gEnUk8Km1wbPzjiTbEEY7Z
 cXpITNG+/c6lDTHQQ2Kd2jnl+9DVX2gtDucseNbuGf3kfrS36RGOEdlXx6BqjMixFAG7ehxSCeZ
 jXwEzl7pcGATNHG1BLYXU/D+vkTSs4HK3Jn/oZYVl70YaC4Di7CCUvDUNX0Jz+z/+NzcatQgFV9
 ok81S2oPOLrK1TM9xOlU2wUkJ7+kCWKtLWt02ov0UxZ9YYB6+GOaF8TWuTEGHevlIwO0nlZ2aAs
 rYj1oo8QLetSHEyAn2XRS/C8nrNzs3ggB
X-Google-Smtp-Source: AGHT+IGw0hM3Y3u9lAh09a4zFHGUlC2itz0RPoBCvFfYPn3BgjYRBhn8aTwtmMHq1kvbXiw9yl1Nog==
X-Received: by 2002:a05:6e02:1888:b0:426:7dd6:decd with SMTP id
 e9e14a558f8ab-4267dd6df15mr70598545ab.28.1758892834356; 
 Fri, 26 Sep 2025 06:20:34 -0700 (PDT)
Received: from orangepi5-plus ([144.24.43.60])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-56a6546199asm1835028173.25.2025.09.26.06.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 06:20:34 -0700 (PDT)
Date: Fri, 26 Sep 2025 21:20:16 +0800
From: Furong Xu <0x1207@gmail.com>
To: Rohan G Thomas <rohan.g.thomas@altera.com>
Message-ID: <20250926212016.4fd369b0@orangepi5-plus>
In-Reply-To: <20250925-hlbs_2-v3-2-3b39472776c2@altera.com>
References: <20250925-hlbs_2-v3-0-3b39472776c2@altera.com>
 <20250925-hlbs_2-v3-2-3b39472776c2@altera.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 2/2] net: stmmac: tc: Add HLBS
 drop count to taprio stats
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

On Thu, 25 Sep 2025 22:06:14 +0800
Rohan G Thomas <rohan.g.thomas@altera.com> wrote:

> From: Rohan G Thomas <rohan.g.thomas@altera.com>
> 
> Add the count of the frames dropped by Head-Of-Line Blocking due to
> Scheduling(HLBS) error to taprio window drop count stats.
> 
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>

Reviewed-by: Furong Xu <0x1207@gmail.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
