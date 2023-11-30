Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE057FF944
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Nov 2023 19:25:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 932FDC6B47A;
	Thu, 30 Nov 2023 18:25:20 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2FE2C6B479
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Nov 2023 18:25:18 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-5c08c47c055so13489977b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Nov 2023 10:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701368717; x=1701973517;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A6XaBmabZtFG50aNMROWpohKVYoF4xocW5H2FTxC+9Y=;
 b=WF3JX1lCOHlHed4qCRrSjiYmQCmZOejcN+nAcRQsDClmtnMZV3F5rslRdCs0rOkxYL
 H3OHizA9tgx7JPxwUmSHta0ELGqtkJrkYVTqy7CceuEb3ikQbDjQVWGdKxJB/4eYj3uk
 /ow400nYy/3UpXfBfxi6+0C4LpMJYB6DphiKS2l3nFufI7qW2pklE6XbYqrsQWL+x//w
 vJTWxVi+IRkYlbjD90iwX5bHMvNOyjXAEJdelbOBkF6orNqG75IfflaUQ58SuYluPcJg
 HxM56Zezl2ZSmFcIGqxwLjaXrfG/UcUicb+qtKzaixxzvToDlxuWXoBlkrgu1SJ/hFjE
 VDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701368717; x=1701973517;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A6XaBmabZtFG50aNMROWpohKVYoF4xocW5H2FTxC+9Y=;
 b=YU/ICM/IfwGUjsT9N88yRsvHDDYMDdidwOP6j7wZl9YUESkazxe8lLWIMSWy4ky1vg
 ZstJF/z3xATApapBHCYtxChTCXGZjqj9SuLFb3MQAJn7MJdUm0Gsd2b4YU0m1yidYm/D
 VodjCjmpSO5d00lXknrnRQqWuGonEyPpJdSNvd8BsS2UzGFFaoYZkYPaZAaTesqc8ERI
 30xnqE3XNQfsZRXw0sByIPgP+EeJcKNkwFzojcc5BjnHB/wD7/IaANxuUxiZL63P4SbD
 ggOMDrfX5uMkFnmBbeFvqfhYKrR6wF8EXJA2tdPLsfiC/pZfG58CoMl1A6pzPjJ3+fzT
 0twQ==
X-Gm-Message-State: AOJu0Yx33yqRDZAx0chl3PQsc8z5FPE0M6m+GlvbWJ7GqwyPG7C4BieF
 jC/aFgwBWZCPyDfviqZpRaCGo6WkDuKx7mYFiOo=
X-Google-Smtp-Source: AGHT+IECxm8oMNxT8KIHQVCeAUTR2MGh4E9JHpb63/3Y4Q2Le8BmFXxYDbE4XWEDdDdN3V+Hw01yp8c1QDzp4GKgVyg=
X-Received: by 2002:a81:9a02:0:b0:5d3:b0c5:3001 with SMTP id
 r2-20020a819a02000000b005d3b0c53001mr1430153ywg.23.1701368717599; Thu, 30 Nov
 2023 10:25:17 -0800 (PST)
MIME-Version: 1.0
References: <20231121151733.2015384-1-tmaimon77@gmail.com>
 <20231121151733.2015384-3-tmaimon77@gmail.com>
 <6aeb28f5-04c2-4723-9da2-d168025c307c@lunn.ch>
 <CAP6Zq1j0kyrg+uxkXH-HYqHz0Z4NwWRUGzprius=BPC9+WfKFQ@mail.gmail.com>
 <9ad42fef-b210-496a-aafc-eb2a7416c4df@lunn.ch>
 <CAP6Zq1jw9uLP_FQGR8=p3Y2NTP6XcNtzkJQ0dm3+xVNE1SpsVg@mail.gmail.com>
 <CAP6Zq1ijfMSPjk1vPwDM2B+r_vAH3DShhSu_jr8xJyUkTQY89w@mail.gmail.com>
 <a551aefa-777d-4fd3-b1a5-086dc3e62646@lunn.ch>
 <CAP6Zq1jVO5y3ySeGNE5-=XWV6Djay5MhGxXCZb9y91q=EA71Vg@mail.gmail.com>
 <25d0c091-3dce-4d62-a112-c82106809c65@lunn.ch>
In-Reply-To: <25d0c091-3dce-4d62-a112-c82106809c65@lunn.ch>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 30 Nov 2023 20:25:06 +0200
Message-ID: <CAP6Zq1gS_cX9t3bkvvEUAHh=GpBCW6N0vB7zfvhHMVkuxrCh7A@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjaminfair@google.com, davem@davemloft.net, avifishman70@gmail.com,
 venture@google.com, openbmc@lists.ozlabs.org, robh+dt@kernel.org,
 tali.perry1@gmail.com, mcoquelin.stm32@gmail.com, edumazet@google.com,
 joabreu@synopsys.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org,
 peppe.cavallaro@st.com, j.neuschaefer@gmx.net, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 2/2] net: stmmac: Add NPCM support
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

Hi Andrew,

Thanks for your input.

On Thu, 30 Nov 2023 at 19:26, Andrew Lunn <andrew@lunn.ch> wrote:
>
> > I will check with the xpcs maintainer how can we add indirect access
> > to the xpcs module.
>
> https://elixir.bootlin.com/linux/latest/source/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c#L449
>
> It creates a regmap for the memory range. On top of that it creates an
> MDIO bus. You can then access the PCS in the normal way.
>
>         Andrew

Best Regards,

Tomer
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
