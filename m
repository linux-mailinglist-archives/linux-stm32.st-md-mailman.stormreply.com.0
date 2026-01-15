Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A7ED2CED9
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Jan 2026 08:08:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CF6BC8F296;
	Fri, 16 Jan 2026 07:08:31 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 404B8C8F274
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jan 2026 10:26:28 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4801c2fae63so1804315e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jan 2026 02:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768472787; x=1769077587;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JLly7CGERK95lIS5prsdJ95HAbwiiwFAFGJDvTd/YQs=;
 b=MyigVUBoqhAoiQSshqxfhe2KIxDiZLKxMpNOtvugOWF2d4j+PEdctoNfhs90NTGrTS
 OgndDCX06px49O57t/sTZ4cmKTkdy96Wx+NqlKBBwPH0EG7ADnBwP5EFTwsBYx7TtUwz
 Y2Wr7eUgRqnZYMFd0ikvPA/Ftk2xsjOAOTFi6DDaZ4tqJJMlvHK+mkxbx24w4Y6OIgjJ
 3o4b5PBJomQ+gp55KbLUa8xi5+nSgpz076om5NLo5rC5xcJBkXeUSFGNqWBlaBwzsHdx
 u7j0VktzzlpLwRBkYhUpJbLsL6G6Z2JyGeZvTU9IKAHJop3rgI6zbCHi/nGp/GU4UrnN
 J7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768472787; x=1769077587;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JLly7CGERK95lIS5prsdJ95HAbwiiwFAFGJDvTd/YQs=;
 b=rD23bR4nJqdD4/3HJ3lLzq6sQrle4+Go2gFNUWtFe6/mIGE05clmHgQhc0EAFpOsBP
 X4k+l595gJOa2qeYGCZ8jzKmxclZ5feflWgxdaMgJAk0D3CSRu6juNJp2BH8hU1+uc5n
 pp/9BacNZwwitl8EPqARWSe22xn2wgzk0jGr09hDNoRzFG07lrnNEd74+BxI8r1w5tan
 v0BowmvFiwMCAUZv39PvsKvmJMm4PvqUMhaqdjuOfthBZ/aZJUmIBxD7NNe0eBpguYnH
 0AeU6lzHkALmfxAq21r/S2n/6kxyPZ71injQxXcWP6q0xqidNiNf5XUafYFmhjbs9wEp
 uRNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCseAntaHvKD7bbm4C4xflSSHzhTDTeQ7E7EUHr8SHpTqX+DKlU80CJw+ezMKbqW9+sZu29NJk248gCA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyvDXsIWhDqqSK7cQT6L1n5li56oM25NiuG2A0DE5WqKY9XfldN
 jLDp1eNQ/lVCuYOHTKwDlZUxI3KcBy8j69x9wsjBR1X/JxxArLVgHPkrnVDaIPzZu6c=
X-Gm-Gg: AY/fxX4SxqYKxGQFC5RYUPjUnRXzROwUxFSdQJdY0Vv6z2sZD3DIJDL6M0EFpvGmFHA
 mTAsW9lEsJTab3QziDJaWf6B/op3pa77cKJyHGv95slciyOQwYlwGC43BLddU4QKc6jFJs0YkDx
 ccqksVMPJ6psY0T9uTfPgwjJYavOyjzPVJWI/AA/vJCpgyhe4REKeNR0XenxqYNeJMNKv1mXJ7l
 qlbx6dOEgalumnM5xlbslI/K/seqHr7eNGdCtYN+M5E6EQkFkUxNjO81JBDbtHaPLT8QKFboDc0
 Dbvc0MyWN8/yUdyJsm2KYn5oEq9xWbbjFzeuFyKBFEwld/NneZoOy7JG1lYp7K12aOZqtDN9INW
 wV241NjEhPRUr8R6xfd/meZgoDszP4KU17DLyIOoG0ej5cCinKKErLmBIYKsfkXrHeG82IZSheu
 QWfubMbaGF+prbvQ==
X-Received: by 2002:a05:600c:8b77:b0:477:afc5:fb02 with SMTP id
 5b1f17b1804b1-47ee4819d6emr64067955e9.21.1768472787399; 
 Thu, 15 Jan 2026 02:26:27 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af6d90aasm4935338f8f.29.2026.01.15.02.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 02:26:26 -0800 (PST)
Date: Thu, 15 Jan 2026 11:26:18 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWjAysWXHUOHSisl@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-9-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-9-21a291bcf197@suse.com>
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
Subject: Re: [Linux-stm32] [PATCH 09/19] m68k: emu: nfcon.c: Migrate to
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

On Sat 2025-12-27 09:16:16, Marcos Paulo de Souza wrote:
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
