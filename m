Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5AF944FD9
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Aug 2024 18:02:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9431C7129D;
	Thu,  1 Aug 2024 16:02:35 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2BDDC71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Aug 2024 16:02:28 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-42817f1eb1fso42184405e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 01 Aug 2024 09:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722528148; x=1723132948;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JbM0mobM8XPHWJlV+GkhV0iKaT4Ass7pcwi0VX4eFCk=;
 b=CNkGb18bGrbmQKPJypzjMHDaEn9p/UOdn21OABNbqKzXc3cFtSXIlmDii9nsrD4sXN
 trRb2qsJ5GkMjL3rdMVaGirOHgdq3+xMN/aZvJKolXKOh/Hc7BogD/uLoyBQXUuuSRyt
 DhItxujGMv53gYtR51s3xlkskJrEDbhz42zlFdyV54KeXfJTcecz8rjX1grVs/I+J9r+
 76j4cazpFrRcPvpJENvbSwl2m9zQUdZQJ5tGhk0mbzzQYL1NbTKvn93f5gqjxP5dA9cS
 LHiewmwE8MSI/27A/OjBKlu6GzD791UIKcJT+5rmmBAQWqA6YTo1RC9Rkbc7HisnMoby
 1Zrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722528148; x=1723132948;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JbM0mobM8XPHWJlV+GkhV0iKaT4Ass7pcwi0VX4eFCk=;
 b=U07n4X2WELD1lfWezcbsuqxr5EoejK2ek6NArKRX64vMN6Z34BIdF1VfJdOaRKAuWE
 0QhqzZCLyu3T2P+Ed9IDvNIMQvKoVrmCiRPBGbJFaIqKqEg/bTYqGlFXipq6TAPCucV+
 ATTYKmmQbTBl2zwU93AVyKdWD1DjFU0ftNnpiRjBF3s/fB/DStaUUoYcl0MwfYnhlLek
 3bpUYI7WTYRXJKGcURi9p+MWm1pi9l26ncV6N20NlBDDZgoeey26zG2FpetwD01uGLEz
 UuEK/mehK7Qh4havl2g9JUa1y4N5fgT67BX5gYRSkMq+xyPpHs5hyDvGlhwi34KNuiJo
 pXdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxhTvPCU/ICdEb+2p08yMtsj8o8OPHbeHhrtnaoX7btEIGUc70QGZHiELu1X2rrsAELCLGqTdY5MVOtwc5I6OAPlAvdXeQ/8dR63AgBkAqv8k4TA8ytd83
X-Gm-Message-State: AOJu0YxDW8PX8GUPj4fHA/yCIMwvV0NoWJFPXBEFJ7CkalkLWpIZDqpN
 vfTpHIFb+1AgV2qhuQE8ienA0i9i/Q0+LvUPb9k/6CLK77GjM/vN
X-Google-Smtp-Source: AGHT+IEWV66ZYrus0W1ET1gIeNLur6+QGxyXdCNjV0dIiQyEy2PYiogbwno7MlX6tYQEIb9prjLr2w==
X-Received: by 2002:a05:600c:4e8e:b0:426:654e:16d0 with SMTP id
 5b1f17b1804b1-428e6a60397mr3059625e9.0.1722528147540; 
 Thu, 01 Aug 2024 09:02:27 -0700 (PDT)
Received: from skbuf ([188.25.135.70]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b36800cdasm20140304f8f.64.2024.08.01.09.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 09:02:26 -0700 (PDT)
Date: Thu, 1 Aug 2024 19:02:24 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20240801160224.4f54tanxs5dz5hwq@skbuf>
References: <cover.1722421644.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1722421644.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, rock.xu@nio.com,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 0/5] net: stmmac: FPE via
	ethtool + tc
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

Hi Furong,

On Wed, Jul 31, 2024 at 06:43:11PM +0800, Furong Xu wrote:
> Move the Frame Preemption(FPE) over to the new standard API which uses
> ethtool-mm/tc-mqprio/tc-taprio.

Thanks for working on this! I will review it soon.

On the DWMAC 5.10a that you've tested, were other patches also necessary?
What is the status of the kselftest? Does it pass? Can you post its
output as part of the cover letter?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
