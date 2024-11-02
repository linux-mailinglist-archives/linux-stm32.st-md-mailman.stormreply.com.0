Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED41D9B9D53
	for <lists+linux-stm32@lfdr.de>; Sat,  2 Nov 2024 06:34:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 981A3C71290;
	Sat,  2 Nov 2024 05:34:15 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6CCCC6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Nov 2024 05:34:07 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-20ca388d242so27111865ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Nov 2024 22:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730525646; x=1731130446;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yl0ZSjV2wwdG7v/jul86kkIeCsNbggoH1Vd4XqoR3yw=;
 b=MPyvvSr0zHxb1Th3Q+UWZllK8m5JKVVRRuIUUwbALp4GEQ26L9y11J+zkVynFMm9d1
 sP0oAkMgcTGThUiX4aGVSYBpV8bih2XUznF5WqppCfBUxT7DanqSSmQFWLJKep0T6mk6
 cHMsJmHCjzY3dqyUoiuj+zNkztIbnB3PwRIFP0a3+SQ9c+i2lE4h8zJOyke5hS8df2Ha
 xmxf/MsPGLCx8QKhmojvR8KwBuAP6FSvbU2hDHQ7iKALA7ebIQIa9dtTyR8ypU2Mtbue
 q2uPPgCTi/r44t+zIoigFYa4KjSh1IyZvoAO0Xj/N2L/LjuWcUKVFzDDLxARQEBnvCMO
 u/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730525646; x=1731130446;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yl0ZSjV2wwdG7v/jul86kkIeCsNbggoH1Vd4XqoR3yw=;
 b=en2caLM23a7eXKvzWBWVY2OXvkP3FqpP/MYJjNFBeb2f3kLsaxkERhpdw4f8w0cIwB
 LKFMeRaIDv5kSEdzRP4umwASqOJf17EcndHrxaX+eJ833GcN5HhvBQpCgVyXL15DUN7e
 L0ET5sNbSo0NMq6wjPqecY7QgOSfa5/xXHrv5uyqqdtxv4WchREpQXxWNFjU1ijJ7L2m
 h2FzWyqzDpdfuEx1MnNqpNWE77Rn5Ys/pbwDjQUkMmb5VrHbhSMX7fDRMYCxw1JQvvY9
 qb48x7bT6wect6OuBEPuzLWPJorRQVuJ3F6bUuTh5IPFq+wz5fiEhYhP0FvRGce2qdID
 cc7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV38Y8pEHAz2m32cs2MpKZXuMBuALrUUvuZ01gUpv5DIOvetimIAEV8eAXC65Y3d4ymAlwTMAg1YvzaWQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz22Ss3m2lBg+TxF6VsahUlWOAqctyrw25aQ39O+Banb8JGjbS0
 wb8KR5DIm9Xqs6PTZiUyUn2szHXju8PfyVxSRQxwiRE9pgUCFXho
X-Google-Smtp-Source: AGHT+IFSBLSRmWr+ADqlQojeA6O0wCRf+1EVr8y7UIwQWNNJ4vrlbCerMlqoHCiFATN78RepdHZAyA==
X-Received: by 2002:a17:902:ce85:b0:20c:a1a3:5373 with SMTP id
 d9443c01a7336-2111b01c640mr83003945ad.55.1730525646080; 
 Fri, 01 Nov 2024 22:34:06 -0700 (PDT)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-211057a63f2sm28700365ad.168.2024.11.01.22.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 22:34:05 -0700 (PDT)
Date: Sat, 2 Nov 2024 13:33:54 +0800
From: Furong Xu <0x1207@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Message-ID: <20241102133354.00002357@gmail.com>
In-Reply-To: <20241101142908.ohdxsokygout5mfs@skbuf>
References: <cover.1730449003.git.0x1207@gmail.com>
 <20241101142908.ohdxsokygout5mfs@skbuf>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v8 0/8] net: stmmac: Refactor FPE
 as a separate module
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

Hi Vladimir,

On Fri, 1 Nov 2024 16:29:08 +0200, Vladimir Oltean <olteanv@gmail.com> wrote:

> For the series:
> 
> Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

Much appreciated for your valuable comments on this series and also the
previous series that moves stmmac FPE over to the new standard
ethtool-mm/tc-mqprio/tc-taprio.
The FPE support on stmmac would never be so complete and so soon without your help.

Have a nice weekend :)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
