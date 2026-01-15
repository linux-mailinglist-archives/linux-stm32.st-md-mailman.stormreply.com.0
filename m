Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA51D2CED4
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Jan 2026 08:08:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22C7DC8F290;
	Fri, 16 Jan 2026 07:08:31 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5051C8F274
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jan 2026 10:20:04 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-42fb2314f52so347528f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jan 2026 02:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768472404; x=1769077204;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Blw9ol92Adxv0ebGIyoRpKSiGhl8JOSAW1An3S4C+Hw=;
 b=eKTCC8VxuZAJFAFoSnixjyRyJ1rPS21mvodPUqyLQOlTrVurH93kVjcZN5TgB9sfNP
 mfFdUOaexn97RriwEAFRL3BVf1uHiczH91uIpSoDKr69cHYfKSPALoyEM//4rc6u7yi5
 uaTFfaEzNXRml67RmuAtMupdH0u7fGsJSfKdytjT/gzoiJVM2LZQzBrZlX574M08yjGA
 7GFU33DVPVamfcB/NqkBiWgvZ9boVAMI0sE5b5qatsYukqBcFQy6AHm4Z60JjCnqsDIG
 4iYMVYweLHgwXVTCxmMIhGp5x3pcJ803ci4MUHDK33b87UJXQgWXc+/VsKfBoGwFd0AO
 Q3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768472404; x=1769077204;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Blw9ol92Adxv0ebGIyoRpKSiGhl8JOSAW1An3S4C+Hw=;
 b=oeaMS+Auxpa75L+evY9xCrfImSiJ8A8hEMyQVdg7pyHJt9YUKSaqDnxPCsn5nXeuKI
 CtZByXqMVa+n8rFdbjEhou1KjvTNZAm7HBeps/q5KPdNOyG0n/+sPa+/wvSpYQR7KH5o
 nwoJW6HmAR5OHjc7olFlbaHN/bt1rma0Y+bqgacxAdROCLXbI67HWubFdG5kjxzJOsXq
 cZrKXVTBdUhgkIP1Yvoe96HUCY8Kgd99fZoBPeANnu5ky2+gR8oQjfxXpwr1OftF3F/q
 KezxHqs73uRHQ1AfQ54YPcx3+KhCLxRaNUOLQaptSXT+EP09q3BQNhHRoS6BLEytLcJ5
 o5vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVD+X0MN5UGD/Sx0wW4Iurl/llrc/ewb4GASx49x0lVauGBFjNnz1I29cerDH4vFYza3Al+boG+D6p1IA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw1O9rHGIbXbQeLlZ5LvvGxPacZKdZbgF/a79ssMrBpWQjLJZOA
 cyQnP48Iw4VZo1Rm09dCMgSITC4AGGHnJv1eGnt6bP39H0sR1uh+dCFETiWQ5YL0pVA=
X-Gm-Gg: AY/fxX4af+FCcm6lqTfsmUpvmMJGlhaIYqXlGf9zYdieK/i+t5nzRa4ghilpubcvzeN
 TPAP71T1ZtlBJ9W7V7sJECTTFbaZMQVF60pI9eCY3ahws95Y1TFIFi2hghLSXGCK0IebRIUOqMf
 zEw/Khp2UrrqfkJrhX/XEm1n6gAraRB+4u3zNeoUJHhP0t3K6Z1tvvaVzV4fEjjMZgPZfJgn+am
 akmxRCrN1Uu7+EKzr/4ymQyIlp7nT+XwIPpIDyKx9+x12yv2PgiUHXijgNfywVCOHXzqtiTXF91
 gYYDeRXx/bBAmMlYjICZGQMIgbZdcogFFYNy1bUyqXLFKxn5FebkqLKuuWYzwG2xnXJsMqwSk8u
 f7L5yOA4wOAazEn6QiodXe92WnH3wbGOizH4OYx/ZzgrkMkVUue5SygM7Dfcar3nkqSu85AbCED
 Tm/tREuHA+6w2bQA==
X-Received: by 2002:a5d:6b41:0:b0:432:a9db:f99d with SMTP id
 ffacd0b85a97d-4342c535db3mr5505744f8f.36.1768472403629; 
 Thu, 15 Jan 2026 02:20:03 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af653632sm5139931f8f.11.2026.01.15.02.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 02:20:02 -0800 (PST)
Date: Thu, 15 Jan 2026 11:20:00 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWi_UJcrphO9Esxw@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-8-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-8-21a291bcf197@suse.com>
X-Mailman-Approved-At: Fri, 16 Jan 2026 07:08:29 +0000
Cc: Andreas Larsson <andreas@gaisler.com>, Kees Cook <kees@kernel.org>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Shan-Chun Hung <schung@nuvoton.com>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Breno Leitao <leitao@debian.org>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, sparclinux@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Richard Weinberger <richard@nod.at>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-serial@vger.kernel.org,
 Daniel Thompson <danielt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jacky Huang <ychuang3@nuvoton.com>, John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-m68k@lists.linux-m68k.org,
 Nicholas Piggin <npiggin@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>, linux-fsdevel@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-hardening@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 08/19] debug: debug_core: Migrate to
 register_console_force helper
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

On Sat 2025-12-27 09:16:15, Marcos Paulo de Souza wrote:
> The register_console_force function was introduced to register consoles
> even on the presence of default consoles, replacing the CON_ENABLE flag
> that was forcing the same behavior.
> 
> No functional changes.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

LGTM, nice cleanup!

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
