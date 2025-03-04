Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDD7A4D95A
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Mar 2025 10:54:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C4AFC7803A;
	Tue,  4 Mar 2025 09:54:41 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D38C5CFAC44
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Mar 2025 09:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741082079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u7cLRomgT9aYrM8YJE7hwcT94wlH0qz2XRoudr3Vr10=;
 b=P7F1tfveGx7sbKQfgNrnqVOyKW6oY+YWQfFzCeKFfDBdhrsWPgg+WUVmPx5oxQ3+lEO5KG
 m8aaf7+d5z954gsn9yHVO4aVHJGgBR1qJTokOKMmpQ6/LPYGJZxnp54wHhZjTJReQzGL4D
 VHQwtemXON7iqrxHqRemhl8ZL2imMZk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-itEi5bQXPDeXlOYDAps0bg-1; Tue, 04 Mar 2025 04:54:38 -0500
X-MC-Unique: itEi5bQXPDeXlOYDAps0bg-1
X-Mimecast-MFC-AGG-ID: itEi5bQXPDeXlOYDAps0bg_1741082077
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43995bff469so37918125e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Mar 2025 01:54:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741082077; x=1741686877;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u7cLRomgT9aYrM8YJE7hwcT94wlH0qz2XRoudr3Vr10=;
 b=RIqyebghs0LkMgxyjpEQBXjpzwIMMRYrZQ4cz7nIoxqETqnC0B5XQrqgEwE8ubuyj9
 pUcOVJttUhcnG3ikWwpxYGkppvNwRDDMXrRqkTWlTIxp6C3GlSVkU7iqXQDVEKhVMk65
 Je7S0dA3WASno7iqvKKbBED1fJt/0erWxmYqiU+wcaB5AvGS8TsT48jvSxIbdWdrbDq3
 CYUPICBzOhduzis6M/Uic+1fthZEBVYzhlNS2wI/b8YUZDF+juQ0BXkX1qQH7Fhtcny/
 88xdJwA9VJcdRQZClZ5EKorD/saDAfpNVe0Svp8ojtxSXc4TWCBHaLjkhj+bQuygzy93
 AETA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULenJGa96rNzCysgmhvujSPBxakqGnlBwXEw9DzViObHfWU7jDBIknBsxU30wcDCWeH0JjbsDxeTvxOQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyGlZuaH7q+ak4aAkjacUMT5QTS9jKqVREBtlhOzTX06cVZbuEE
 c1lqjxBxzOkcf1YHde8CK4XiKIaokNbp8CcLS4FRGXXhj+U1fGmRWqN5PdUoObMnWxfnvwCA1Sq
 k4Pnuv6Fh/ih+JzbLLv4ka/8As9jX/tGXGE65wxYi0AzYTBqNjZsqLmnxCPqEGW1I8sV7tnc8/v
 VPXA==
X-Gm-Gg: ASbGncti1A5Kl4xpCzX9EyYr9P8j8XFfVZW8ieLM8eQXfgq3G8JgJB70MilBSEY/LPM
 VccYrqH8H2hd9GjRgh1Vljpa2x9QUFaFwWYdvQjr4fgcrPNXwYeQN7vDVinZ+dd/6o34NcWpWPf
 pDfAE+vzMo36e8W07xbmIxTDgJKkfDlkwSwIivOJyAf5HGl3MZPXJZHjuFDrqTTLvGPpMjrXU9z
 d8tYdSaY3TkzSdnz9YWhcUxhB/WYRpv8cYZwz2gkDCV/WzJhmzimfRF/bmq54gzm3oWc8IE/Zhe
 7XJRAysRZm3eFFcQradd1gaj8MAxaXpMXqcqpwDrm7Nt3g==
X-Received: by 2002:a05:600c:1c8c:b0:439:9ba1:5f7e with SMTP id
 5b1f17b1804b1-43ba675a843mr118312655e9.21.1741082077454; 
 Tue, 04 Mar 2025 01:54:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCYvnIe76LEUSPaxBjczhESkT9xksjygv9YFGPgN7D+cz81nubOVGbUrKCatMMMLTJvcstbw==
X-Received: by 2002:a05:600c:1c8c:b0:439:9ba1:5f7e with SMTP id
 5b1f17b1804b1-43ba675a843mr118312285e9.21.1741082077032; 
 Tue, 04 Mar 2025 01:54:37 -0800 (PST)
Received: from [192.168.88.253] (146-241-81-153.dyn.eolo.it. [146.241.81.153])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bbc030d24sm82094335e9.22.2025.03.04.01.54.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Mar 2025 01:54:36 -0800 (PST)
Message-ID: <48885074-b590-41e6-9794-49ec12713cce@redhat.com>
Date: Tue, 4 Mar 2025 10:54:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250227121522.1802832-1-yong.liang.choong@linux.intel.com>
 <20250227121522.1802832-4-yong.liang.choong@linux.intel.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250227121522.1802832-4-yong.liang.choong@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3jRPtm29pzVhO5eEJYJmwUK47W9fx1kTeWwjRR_d950_1741082077
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, David E Box <david.e.box@intel.com>,
 Eric Dumazet <edumazet@google.com>, David E Box <david.e.box@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, linux-stm32@st-md-mailman.stormreply.com,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, Borislav Petkov <bp@alien8.de>,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v9 3/6] arch: x86: add IPC
 mailbox accessor function and add SoC register access
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

On 2/27/25 1:15 PM, Choong Yong Liang wrote:
> From: "David E. Box" <david.e.box@linux.intel.com>
> 
> - Exports intel_pmc_ipc() for host access to the PMC IPC mailbox
> - Enables the host to access specific SoC registers through the PMC
> firmware using IPC commands. This access method is necessary for
> registers that are not available through direct Memory-Mapped I/O (MMIO),
> which is used for other accessible parts of the PMC.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> Signed-off-by: Chao Qin <chao.qin@intel.com>
> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>

Hans, Ilpo, are you ok with this patch going through the netdev/net-next
tree?

Thanks,

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
