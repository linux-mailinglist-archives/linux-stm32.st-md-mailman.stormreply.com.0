Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4D29F5CE5
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Dec 2024 03:32:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B32AC78012;
	Wed, 18 Dec 2024 02:32:29 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D69BC71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 02:32:22 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-725e71a11f7so222568b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2024 18:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734489141; x=1735093941;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mi6OX5/5XV7YpUmNND/cHCqDPIuMkirhCKEh+GcVF1I=;
 b=K1qXhRC+3gCx0in5dT/6AGPvwzMUwJMan7W6xgdJAYGtlRH7IUzB4dEELjKGzTCmK2
 k+QvfVGyW7J1EkEDPtoqFqBGRchljKQl7VKpqnFoytzmhYBy53NpiR0CC2vwVvf+Puz9
 m/QpdOV43lIAwuTzJPwu5pw5wsAXr/jC7GS26m1epz96mODeWQJqwZXhmNcInATgYXA9
 U8ctVhw0OXmKbQczxWSWputDJAKoNBOYy45yUyyAl0G+pFKkOZ+ous+hIWOXo7KLRqCI
 ua/6n1lHw6drvMJrst38ns24Av46C0dIdqaHGHRc8tX4xUA79DEMruT+amgqiBy3P7xs
 97gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734489141; x=1735093941;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mi6OX5/5XV7YpUmNND/cHCqDPIuMkirhCKEh+GcVF1I=;
 b=AuZF2DVG/9zj/urMXsB8FdyAuSq5aOQVxYH9A3C13LrH1a6G7E9XFt3qz7bzzwMAqi
 479+38O2s8SaEadDlV/2aySpXzgtOp3Q/V/AVPAPNB6/VhDQ+aUO6XmMZ0bKu6xpcIYa
 pF/1sffHSpU1Pxw8LDtpNV8WJx9MBn9sRu9HY+O7LGD7c7F7EsWSI1B5nPpuSsnOpsVj
 hIdC6li8FNASS7/IDOmGthVgh8WiMM+D/eu2W2MsE/GUwYO2C5wTqsXtGToGfW24CW/o
 8PizbI/LaX0MG5HWpkvPhDhqfbsHjV3F7CkTBT5ij3r5EM7nEGmXLrthX0QhZtorpBGw
 J0vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7YCLlR7/PEW1WjOoqsGwRlCNQh1RljMUs5oAd8oKd8kJSDcdyER9CIGJ/pR9OShyAzET2Y2YPXMobRQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxDc7GnA34kzfVSJAwwyi0GtyZFaftzbG8G6H/8a6vg6XIf0XTC
 npSdliQChlbWDiFOnMADul4/h2OXCjFVx+GB0nW9M/8MpWPpbybA
X-Gm-Gg: ASbGncuv/jSttp7GscYNaCCpCE733iYMwc+FQskYzytNUfND2TYIO8zKGmkmz8/KSKn
 nBr2d2yFeKJgtOplYzz1eEf2ufWwPizHBjGRUJVpDb1UUV6B5CAXPsqWHKBJpMK2Jm02AWDVlzk
 r4dk4JTi+KrcpZGXFYN/2TqtlQo+FbPvRqRpBi+JGgnOuMmRI74fkM3swHiB3OClPrLTD9gPlUM
 BdN/LJZZ1qu5kF/qvUoTNi6R6nKKPzZDtC71O8S9p3S8EjP/JMIOA==
X-Google-Smtp-Source: AGHT+IGOi/F5l1GM4Se3SaVQy/qnJilh4hLpQ88FZFsSLJ+TwRZhiHnC+Sn+xH74+w/kACljDGykiA==
X-Received: by 2002:a05:6a20:3948:b0:1e1:b1b4:59b0 with SMTP id
 adf61e73a8af0-1e4e7993bb5mr7315774637.18.1734489140791; 
 Tue, 17 Dec 2024 18:32:20 -0800 (PST)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-801d5c38011sm6345778a12.74.2024.12.17.18.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 18:32:20 -0800 (PST)
Date: Wed, 18 Dec 2024 10:32:10 +0800
From: Furong Xu <0x1207@gmail.com>
To: Simon Horman <horms@kernel.org>
Message-ID: <20241218103210.00000dc4@gmail.com>
In-Reply-To: <20241217163538.GU780307@kernel.org>
References: <20241217091712.383911-1-0x1207@gmail.com>
 <20241217163538.GU780307@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v1] net: stmmac: Drop useless code
 related to ethtool rx-copybreak
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

On Tue, 17 Dec 2024 16:35:38 +0000, Simon Horman <horms@kernel.org> wrote:

> Based on your description this feels more like an enhancement
> for net-next, without a Fixes tag, than a fix for net.

Thanks, I will send to net-next.

pw-bot: changes-requested
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
