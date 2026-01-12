Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E95D9D148ED
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jan 2026 18:53:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97AB4C5A4CA;
	Mon, 12 Jan 2026 17:53:32 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4968EC2909A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jan 2026 17:53:31 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-477770019e4so50561395e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jan 2026 09:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768240410; x=1768845210;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=y6BPssvuqQ/qH26ZtP7OKYRtO9FGOS74oztLC07SRNg=;
 b=S0zxTkscIAQqy+okJqW4zS2JjRm6fhA8dXLc2Ri7/BjcmY6CXsNn30LEGMr3ZKrIc+
 jhOJGIz+XfQ/VKqka1arM4xo3xOKPppSlHQeK+As1dhtoRvytuuQfCmGbjPsliJSWo9c
 IT21HgdX2TVlbXZJUEzeCNcm3SyD3mubsf9M7G7rgC5x2zT+c6uoj6IkhWjGubhE2d/v
 R8aK3bCK9Vhsr6SLaamM09WV2FPM6LZ4o2rPJJJZo0o7Tw9w9M6CiLAblQCJryrhBbb7
 u469sHMl916R9HgJhxDvK5KT5/toWOuJl/b19RyZWgPWFCDnxntvvPn9GV9m2JPZEne1
 bGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768240410; x=1768845210;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y6BPssvuqQ/qH26ZtP7OKYRtO9FGOS74oztLC07SRNg=;
 b=JHqSg7bwyvo2uDNqnfM+vEjihPT9lheL6sYEaOxmLqiXnugFm+qNIv2DJblMfLvWdK
 LITzGoWjaTa7CDDqKu+XqMGzOk0ymYzdD/ZvDYgYtF47XORCRXK7xZ3V7o6QMbTZfbGJ
 QeUkt4j7JkGMJQnNQVnNcOSqdkIdttPG96ee0I/YLfYDi4+wKMEdRlBJ3VP9sKfQSHTA
 7AQpIAbsTyrNBwbQoHCGIL3uJre2RL2uc6GhuFBLPhoF4uqwb6ZwuGGxscABxrnu9lW1
 8Q9KyylIjbNuSREE9gmAA0/QUgxY2MVuZ9OFdE+HqHMLDT2WNOy8KTd3wEdCiFEglvpu
 P3ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUB25GQ1ugEsZ3k65hFpQhV8R4WYLL1gzPfWbfXiqelSjW5t2j9vzqWwoSxXbqEJtw6YM/1+EzxU/moEw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyeeaUZGPAu3fju3cK39k/qY5Tv8P0PsjKFMPXkDjGjkUgFo9oF
 AzoseWvN2LfnPeqQ1ANRlT9swY6KUu4Es1Qbjo7VQB98hra9DpYRKePH/0GJTc+WDxU=
X-Gm-Gg: AY/fxX4hgxeVUthHQ9rcVFZVxF5EgcU2vQJtGy8AoNGQVCYf05vtoUyZ5j+YOvaNdP/
 IAy1qOABLXboAdIN7WoGwnu0ikqx2gCQaW9XeTL51WyyareWUKLqyCkCokJFBTXBb0ZJQxJwflg
 pVgCFrQV2d+GDelCcV7aRZGxIYdoZY61CC0UGm8DG7Nr/QHXEwJ2Apik0M1QwkIwzJ87a/KE5oj
 fyoiWs0uS2icWrv2k0Ll+tEtut8UwnSXVrTbfGwFoWnf/8rOS55S4e2JT9wyzCrrjvz94MSTGLR
 tPYLWyvfsrribjGVhE+XSSsIeFVRZcG0Gfx9046v0IOaBKZgF5EHY0CQQdAYowxnpsOFRWdzF9D
 Ci1Ap7ydj0+pCaKPPZIiSb2Y+RtY0VLIu5ktMRaSUeu6QvoM9NcD9/sCb4Z0iKFaFPtVW3Z3vb0
 65FBD/9+ZrzzrTmg9SDoN09eTktjId6pw0/eCVV1RSqw==
X-Google-Smtp-Source: AGHT+IGfCgsoYudB43gyY5VgiMyajRCyMKVvdA/K1TPc0FTW2J7Pqnzu3xNux2u9C7uenfxIM0LM/g==
X-Received: by 2002:a05:600c:4e8a:b0:479:1b0f:dfff with SMTP id
 5b1f17b1804b1-47d84b170famr247229235e9.10.1768240410449; 
 Mon, 12 Jan 2026 09:53:30 -0800 (PST)
Received: from [192.168.3.33] (218.37.160.45.gramnet.com.br. [45.160.37.218])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f69e13bsm368953115e9.7.2026.01.12.09.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 09:53:30 -0800 (PST)
Message-ID: <0585581cd2f19544c5e1565a9d241697d812b5f9.camel@suse.com>
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Andreas Larsson <andreas@gaisler.com>, Richard Weinberger
 <richard@nod.at>,  Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes
 Berg <johannes@sipsolutions.net>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson	 <danielt@kernel.org>, Douglas Anderson
 <dianders@chromium.org>, Petr Mladek	 <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>, John Ogness	 <john.ogness@linutronix.de>, Sergey
 Senozhatsky <senozhatsky@chromium.org>,  Jiri Slaby <jirislaby@kernel.org>,
 Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Kees Cook	
 <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"	
 <gpiccoli@igalia.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy	 <christophe.leroy@csgroup.eu>, Alexander Shishkin	
 <alexander.shishkin@linux.intel.com>, Maxime Coquelin	
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Jacky Huang <ychuang3@nuvoton.com>,
 Shan-Chun Hung <schung@nuvoton.com>, Laurentiu Tudor	
 <laurentiu.tudor@nxp.com>
Date: Mon, 12 Jan 2026 14:53:12 -0300
In-Reply-To: <836139d1-1425-4381-bb84-6c2654a4d239@gaisler.com>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <836139d1-1425-4381-bb84-6c2654a4d239@gaisler.com>
Autocrypt: addr=mpdesouza@suse.com; prefer-encrypt=mutual;
 keydata=mDMEZ/0YqhYJKwYBBAHaRw8BAQdA4JZz0FED+JD5eKlhkNyjDrp6lAGmgR3LPTduPYGPT
 Km0Kk1hcmNvcyBQYXVsbyBkZSBTb3V6YSA8bXBkZXNvdXphQHN1c2UuY29tPoiTBBMWCgA7FiEE2g
 gC66iLbhUsCBoBemssEuRpLLUFAmf9GKoCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 QemssEuRpLLWGxwD/S1I0bjp462FlKb81DikrOfWbeJ0FOJP44eRzmn20HmEBALBZIMrfIH2dJ5eM
 GO8seNG8sYiP6JfRjl7Hyqca6YsE
User-Agent: Evolution 3.58.2 (by Flathub.org) 
MIME-Version: 1.0
Cc: kgdb-bugreport@lists.sourceforge.net, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-hardening@vger.kernel.org,
 linux-serial@vger.kernel.org, netdev@vger.kernel.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 00/19] printk cleanup - part 3
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

On Wed, 2026-01-07 at 11:22 +0100, Andreas Larsson wrote:
> On 2025-12-27 13:16, Marcos Paulo de Souza wrote:
> > The parts 1 and 2 can be found here [1] and here[2].
> > 
> > The changes proposed in this part 3 are mostly to clarify the usage
> > of
> > the interfaces for NBCON, and use the printk helpers more broadly.
> > Besides it, it also introduces a new way to register consoles
> > and drop thes the CON_ENABLED flag. It seems too much, but in
> > reality
> > the changes are not complex, and as the title says, it's basically
> > a
> > cleanup without changing the functional changes.
> 
> Hi,
> 
> Patches 7-17 all say "replacing the CON_ENABLE flag" in their
> descriptions, which should rather be "replacing the CON_ENABLED
> flag".

That's true, thanks for spotting!

> 
> Cheers,
> Andreas
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
