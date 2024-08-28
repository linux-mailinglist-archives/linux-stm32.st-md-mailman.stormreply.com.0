Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76ED3962CB9
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Aug 2024 17:45:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0AADDC6C855;
	Wed, 28 Aug 2024 15:45:37 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 046C5C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Aug 2024 15:45:30 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-6bf6dedbfe1so38799076d6.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Aug 2024 08:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724859929; x=1725464729;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PZOUe+6mBEPTZP4TSVhRf36gjDMv1iagTqH5nqm+dEk=;
 b=hKswA8Zhego4nPsKqP9efN8lItqP5pMVAcaVRxOgmG94nx9TpikCuag4wHGL3+cWlF
 Rjtsat75O5s71gL4RxU2AmELbQquxetRA/kSDqlhyLIc/x+NDOi2AGesWmBg9cRXAxyf
 e43YHFLmD8hflPv7HcjFJMAER9h0kWGtuTFaMf5+rmGs+U+omMgZLVIKdEuiSk5zUAEe
 KQTg1kfEghdn5g5rQbOrcgoCaH2uDxMph0ORQciEl5IjnIqucEEsAFTJf5df0uE7lLCC
 NJt10msqirJFbjjhfL9UQOQ5BsujQDYp+wNssGfEh4jAI7IyrSxp6kbxHTOXwyrmWbyw
 oNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724859929; x=1725464729;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PZOUe+6mBEPTZP4TSVhRf36gjDMv1iagTqH5nqm+dEk=;
 b=kcJbkuGrEE8xp5dtfK3SA4nt3yIis0Jn55lRgMxQi9eWLDIeVZVYINSrTS+8qM7xY3
 +rpB/wWrzaU97ueKtas9gmvDejv7aESyRjDLUc8uQARvgtsZWG6GAx+i4EJhHi9uRlwA
 cwjocsA4u62PfnKaZ1vp9JeGDVhLdysH4FykujWx+HD0AldCuSkFYh6Gm9e5RoV4ubaV
 gTEylzvm/gJBQUvSW+qzgrH0O3Eomdm4ZVqdG2BzMu00Qus5jJRXK5o5PKLf0MI9qLbq
 hve3oT/wDkLiJnOVMPuN7m7yx5CTOj+pyQ+UKQnPJvoPqK8tXvnd2lALrRNEZbsL15p5
 aQhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdciUqcUzTiJB3HWLl7++JiQZ3Xm1g//lSSKOuBOpP9rOasZy8QTEwQ/cL+eWvtQuvMAHMCXUpchve1Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw9Yax0RQ9EdvHCPU+Wjsuw+sXCK3A2x7BfPkuaoxee9mXRVWYh
 7Q+otcTXPwLtXfMctOMXsMtvcZfiM8lRQQTsQP/hZqfsEPBdEvLJ
X-Google-Smtp-Source: AGHT+IFQmS19Ly4t1qu81gaSL06dZhIAsQ4bEbru5NbdTJjKT/mLIQ+HckN7wPPi8lsCzxxsTBJIfw==
X-Received: by 2002:a05:6214:3c98:b0:6bf:7b7f:68e with SMTP id
 6a1803df08f44-6c336337142mr33041406d6.40.1724859928753; 
 Wed, 28 Aug 2024 08:45:28 -0700 (PDT)
Received: from localhost (193.132.150.34.bc.googleusercontent.com.
 [34.150.132.193]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c162d216fasm65998426d6.22.2024.08.28.08.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 08:45:28 -0700 (PDT)
Date: Wed, 28 Aug 2024 11:45:28 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, woojung.huh@microchip.com, 
 andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com, 
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
 pabeni@redhat.com, linus.walleij@linaro.org, alsi@bang-olufsen.dk, 
 justin.chen@broadcom.com, sebastian.hesselbarth@gmail.com, 
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, 
 mcoquelin.stm32@gmail.com, wens@csie.org, jernej.skrabec@gmail.com, 
 samuel@sholland.org, hkallweit1@gmail.com, linux@armlinux.org.uk, 
 ansuelsmth@gmail.com, UNGLinuxDriver@microchip.com, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bcm-kernel-feedback-list@broadcom.com, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, krzk@kernel.org, 
 jic23@kernel.org
Message-ID: <66cf4618f313_34a7b1294bb@willemb.c.googlers.com.notmuch>
In-Reply-To: <20240828032343.1218749-6-ruanjinjie@huawei.com>
References: <20240828032343.1218749-1-ruanjinjie@huawei.com>
 <20240828032343.1218749-6-ruanjinjie@huawei.com>
Mime-Version: 1.0
Cc: ruanjinjie@huawei.com
Subject: Re: [Linux-stm32] [PATCH net-next v2 05/13] net: phy: Fix missing
 of_node_put() for leds
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

Jinjie Ruan wrote:
> The call of of_get_child_by_name() will cause refcount incremented
> for leds, if it succeeds, it should call of_node_put() to decrease
> it, fix it.
> 
> Fixes: 01e5b728e9e4 ("net: phy: Add a binding for PHY LEDs")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Fixes should go to net. Should not be part of this series?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
