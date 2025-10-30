Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C28DC1E1C9
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Oct 2025 03:17:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E6ABC62D79;
	Thu, 30 Oct 2025 02:17:29 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB170C62D78
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 02:17:27 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-7a683385ad8so92369b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Oct 2025 19:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761790646; x=1762395446;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=e0iJfSZcYi4d+4cBtPvkDIcUkSGuJygcNQUXASJtpao=;
 b=gk2ebEIDbh0QKAp3umPTh9NH9jDu0hAPBdSU5Q0PT3x7N0bWfEjH9oIlub+3y5S/RM
 HqbN+gIgfDZYetfrLqGaqMloBulV9LIlsaj4bj7iXrzATGq16YWL0sLRdIKs7btrGVbm
 mXGIJtYDs1yEEI6y7Lms/C3bXpGzBOi5DDUgckHJRxdTZB9EhE41B29BKPDQUs+ucJXK
 NKw5k0HrfPSTbpM6od2iJRpXqLtEkoplxnFfpJ0HlBGnsQ3i0AMfB6LML0BmB1bZlAKc
 8FFSm0sFvPo15nKFGhGXNQffPazvv7ESkSIoZf6mlYOddHhmfUKgMlWgStuCuhJiiQuF
 eXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761790646; x=1762395446;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e0iJfSZcYi4d+4cBtPvkDIcUkSGuJygcNQUXASJtpao=;
 b=Zbvwiclc4g1TFt31l+QkpGIwr3BqbbmXuSudTcMsSWdwIhaW9IShqAW3NCfvvuMvC5
 0YMsLiXOaeJc+99Pjcf5H1x8H9bWRhLy0l0QXXvvcm4tdQxQZxw0OLCJzxX3PdxgKPUE
 BnKfFC9s0XyVv2QyYpr91pO4VzDLIcyR0+3PvTE9qzj4C7BNKsAWA0mzikKCISwLZM8j
 E2BJvnPeZjLLVYsZJwWb0yFP1ootz0cewaPOq4MtQFcdRvETL1f9J9QbuxDQyAVCZf1Z
 nVXf2qjVt5j617xXQVoxr41mbRQ8fGDgQb83/cgKngm3f5RCKTrrEirzKxMrqDFdEZwS
 biYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeZ2yWQjJv9j7VF9xmD96/LLlMiBeTgOvkXmw4+hY3S9rqLblkO/of9Bisgh1R1CHB9XJJdnvU8lQetg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwOTSTt9+ILMARpfDXq+7Jju1mJPLRohF+/2twzz737Cvg/c4Vg
 OB5fSlmF7dIu1NhYmrqqsEDXGK85CrWh/XdmlHhvcqvNLk4jp3JlT95V
X-Gm-Gg: ASbGncsJ6sPWf0/zAt+o4X4Texfz1o7QF4CTBbWd61wJzKlZpT17xmC9tvgUpPU0O7s
 /ByaComTYK4pt8bn17eDiF8s76CSPSSmQGMGvm2ru5LWSC5PiisHuB5u3j7rtUAQWgX1b/3U6Fo
 vkyyUW7+aLe67GfeU0FLdwax+IVVirKjKhxvbNbtVE6KwlZTj5B4rBr29VAbGUCn6BBeVoAYW84
 QUmCdZKh7G6UUEKty0zMU4mRQx3MAMwNtXPaVt8FPpHXgcSDaFWqOR/7An+c8QdwnRfb6qTQevR
 sRQWnmxlVlLcu6c7hS2NMEWjQDUb44eZ9THomfphFB9uGNSHcg4M8btPfhImLLI96A3jWuT8DSw
 Tmrpy0Sv6DcbGB8I3FVK7trG0YjXJOR/4HT07dK4fdfsrIOSE/ezhO5NxRobX8PosEJGe1jm2y9
 nf3QNsx9HUDw==
X-Google-Smtp-Source: AGHT+IGZqbW0+/S17J6RDbXZnRIU8hSK1Dmm2Um3L8P8CRvPomF8j94cwh/RTW/K/MdMyX0p0nhaJA==
X-Received: by 2002:a05:6a20:734a:b0:334:97a7:8357 with SMTP id
 adf61e73a8af0-34787d7d88amr2092916637.60.1761790646348; 
 Wed, 29 Oct 2025 19:17:26 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b712791576dsm14913433a12.12.2025.10.29.19.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 19:17:26 -0700 (PDT)
Date: Thu, 30 Oct 2025 10:17:17 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Message-ID: <td7eseq6rmc3s2ecvcjyyyn5feawjmugzb4ihjyviquro7dv44@3dosfqam6h7h>
References: <20251028003858.267040-1-inochiama@gmail.com>
 <20251028003858.267040-2-inochiama@gmail.com>
 <20251028-parka-proud-265e5b342b8e@spud>
 <rclupbdjyk67fee2lgf74k6tkf7mnjcxzwcjvyk2bohgpetqt5@toxvy3m5orm2>
 <20251029-fading-expulsion-f0911c28d23d@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251029-fading-expulsion-f0911c28d23d@spud>
Cc: Longbin Li <looong.bin@gmail.com>, Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Icenowy Zheng <uwu@icenowy.me>, Vivian Wang <wangruikang@iscas.ac.cn>,
 Chen Wang <unicorn_wang@outlook.com>, Russell King <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Yao Zi <ziyao@disroot.org>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, sophgo@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Han Gao <rabenda.cn@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v4 1/3] dt-bindings: net: sophgo,
 sg2044-dwmac: add phy mode restriction
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

On Wed, Oct 29, 2025 at 05:54:49PM +0000, Conor Dooley wrote:
> On Wed, Oct 29, 2025 at 08:56:09AM +0800, Inochi Amaoto wrote:
> > On Tue, Oct 28, 2025 at 07:22:37PM +0000, Conor Dooley wrote:
> > > On Tue, Oct 28, 2025 at 08:38:56AM +0800, Inochi Amaoto wrote:
> > > > As the ethernet controller of SG2044 and SG2042 only supports
> > > > RGMII phy. Add phy-mode property to restrict the value.
> > > > 
> > > > Also, since SG2042 has internal rx delay in its mac, make
> > > > only "rgmii-txid" and "rgmii-id" valid for phy-mode.
> > > 
> > > Should this have a fixes tag?
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > 
> > 
> > Although I add a fixes tag to the driver, I am not sure whether the
> > binding requires it. But if it is required, I think it should be
> 
> Kinda depends for bindings, amending a binding for completeness probably
> doesn't need one but amending it to actually permit a functional
> configuration does. This is somewhere in-between I suppose. If a driver
> change is coming along with it which is likely to be backported, that'd
> be a vote in favour of a fixes tag here too, so that the binding and
> driver match in stable.
> 

Thank you. It is helpful for me. And in this case, it is suitable
to add this fixes tag.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
