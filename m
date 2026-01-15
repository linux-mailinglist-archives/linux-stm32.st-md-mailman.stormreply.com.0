Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2679D2CEDF
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Jan 2026 08:08:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EDE6C8F29A;
	Fri, 16 Jan 2026 07:08:31 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE98BC0693F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jan 2026 12:13:06 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-47f5c2283b6so5175515e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jan 2026 04:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768479186; x=1769083986;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tARhp8b6WpUCQdTEvi4pG8l7ncFl190/VBWtO1OWxSE=;
 b=YfDNhhIN53gUOQRrjFugzs6/b2I169jpvxwlmqM/XAnomHeNI40HcAqNEPKdt5qniI
 NtJ+uoVcj0kRmOLNHzG0f1qHzd7uT0uKY6pVRrRLJBGgVXrMSEQn6TZdqd4qqwNyhiea
 nu9DKKsCALkuBNWvJOxyv2h5OvJyDOCJDU+3PhYpSCgn3BGeOmwN8CHuslo6QZvtUH9I
 XOFmxBDWg6mgP+36gHvqdr50ypIyPhDWFpQh4rd/OJt94Xokn7JMnwVRnIX+SLq8hZhv
 BCuXhwDZZlqMpe03lW4VUeZ6l1fELkAtVcivsGQdtyvyfL7SJ1e4FnDIinQS3RuxZb24
 +5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768479186; x=1769083986;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tARhp8b6WpUCQdTEvi4pG8l7ncFl190/VBWtO1OWxSE=;
 b=wkOnAr4MAlVQYlVO1sPwPH+dXLsewHuwOiWhcy2ltA4qcRHkb6uswREAPqoujsKpw1
 5QD3csL0apbS31HnjAMXThSmBKs5vV9+r4oX9LZ53iV8jvhOmd9i6OTnYe6NaBHV9RLH
 0Z0lzoNJYNYqCJdwbpss69KHVPNeOAgKtcPwqT38NtSPOoxK6vPQzxnD02CbcyiyaqZg
 cWldXraODaEiNoun5ANb5lZU71KOwH7yqtIBVyM9CpX93BvVfyw1Zh6aG2hJyOIPcMCN
 kSkEdil3cX7/ciJ3wzH52HqucpcG9a3C6gTJ1RZe2+YgqWzLPC59vrLsIZBKzXZkeZG2
 39NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5lxMBCX4JRRBqQ11BuDC4gMDZxQH6YQxVN2qmz5YmIHzGFIQhGm0uP9iPgfhrw7XLv6zmV4gxJf/09g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy+KZztGOtMAqX2ABrxasLNdFiQjAnb35jHOMu7HGC6yztIIHWi
 BAhLowGtzlvBr5whLEZfusRliNUBSoqPBbYctVdMLfDNJlNFZT/s+TXpUvu/EFNBzwM=
X-Gm-Gg: AY/fxX6futafOXIQRAtCWwupZwqNkJ4hppd1HpxBicX59ISvSIxXeQYmP24WCqVgRPL
 SXFtr8bYtYXYAh5lDxBgxVi9IU+u/3Nrn7Yy/OBo5wWwZwb++vMYS5OPHR4mV1q5Efjz2M0xh7e
 fJxPBeaZq6rAD8N3CBEh4LP9vAEdztYUfq5WIKLxuXFC7pzjPELnrI7lk8DNz1YsOl02v4Nn6M0
 c8ueNvvXm+O1gtzVCb/xsnwzf9pfOBvInp2DMjm88tCDrozz/2iv71yimMIiBHGDeKgT2woIu3o
 B7ata40GZXp1UJv9begGiLJMBMA+L8oHJRafbQ6ZsrakCEnhCHAGF3huQFqaM0hK5yMfeOdm2pm
 CG8HzQRPLgNhw1Zsm2hWQxWIZG99tYeHXcjy14RGYXf1VzE/lB3tFc5918+pClOY7YDz4/lIwlW
 GOLCNp9Zl2AhzD6A==
X-Received: by 2002:a05:600c:1c20:b0:47e:e712:aa88 with SMTP id
 5b1f17b1804b1-47ee712ac96mr42613125e9.31.1768479186231; 
 Thu, 15 Jan 2026 04:13:06 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801bc3e57fsm22590935e9.5.2026.01.15.04.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 04:13:05 -0800 (PST)
Date: Thu, 15 Jan 2026 13:13:02 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWjZzuY31bg95jiy@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-11-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-11-21a291bcf197@suse.com>
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
 linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>, linux-fsdevel@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-hardening@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 11/19] powerpc: kernel: udbg: Migrate to
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

On Sat 2025-12-27 09:16:18, Marcos Paulo de Souza wrote:
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
