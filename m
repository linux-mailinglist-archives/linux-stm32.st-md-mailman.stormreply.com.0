Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2C8D3A380
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jan 2026 10:43:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DF18C8F29D;
	Mon, 19 Jan 2026 09:43:37 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11A42C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jan 2026 13:54:27 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-432dc56951eso1333731f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jan 2026 05:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768571667; x=1769176467;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2Jyc4vjPWHQ8N29GFPPd4QPUxfDxmdAZddY3K56YrUM=;
 b=g+XuBIscmrsfzsi4sErTDC0bOM/SxVVBkDCbqzGn/2UZr2OY+kJNp2W4bmD3iEnRaH
 lQsVU+DJRBEY9iL2yj3sK/Wl3dFcd0pg0pEhB3Jr/F5CQpFExWIM8+FgF+4mP/+y3LXm
 P6TsZaA3ygGzXkTVlwR9QiKv7PbqamcaeonzDNgQbU9ERrhcouOBWf+ZWvGyundqnl9a
 JrnBevtx367TTj3V2bk0F1sCoJHVxz8sLZM2IBRbN/N1m/O1AnL21jYngt2yhBnPXJWK
 67rQiccL5NX988U/ti9BI4kJ5KAA9Ln2vszjqZN1/hPpZAkXD9XiEjUCqmzI9vCS9ax2
 Zn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768571667; x=1769176467;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2Jyc4vjPWHQ8N29GFPPd4QPUxfDxmdAZddY3K56YrUM=;
 b=HpZKWUp5H4sAqdyCIEHeIl6zYbiAoxv71j6KXyutnDOsQyLSdtomEpjVWDAUMyFJcY
 ePPFyYMK9eFFAReXGZtRSFvZdCNrzLwpZA0DF8KtdXGonxL5BccgOpncJi6u/wDbfAPH
 7ciGcNykmgL18m55YAd37EmgB+LmNm17qD3Nyx+FjFf5R5eCqOCYhhLYwuYcPYX0x+g3
 xW6e2Kb2Q2zxUzLO0XswHZjAN4qR+dzm/dxEJgjRRNGpgP5wsqSDJQrjTO1Y6IWIQKeJ
 Y73mgCxeOZhNr6fAb4bU7+qdPa1Uu11h/vkTKwDCx7kQzBSbqCpmGdwwxTQtbQ5NkwLR
 Q6/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxnIwM7IjhhXpqE6FSb+3Qf2sbaOwnuOseiNcBhLjxhuqIV4CSlkoMRYvTsSJLWGF9sJXfQaol9AkDpg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw57CNxAPebsHAnZQ6q5LL9p3PgXwClDeokbPrDEXreecWQy8tv
 rKGqkJH0++H6c+FeqkKkQpgw369EN4rBmD2/WhZzz/pGa3LV6VPA0sFYUO+bby658No=
X-Gm-Gg: AY/fxX77xQ2Co3CB/xGT8KD0+iV7PcOXe7lF2UzgU1X5gy2k9SGLyyzWaPBqnhJf7qD
 Suwe6DNkifs8KSYmhyBYDF+ubrn4RvrtgEm6Lce0NndXQsb8laLBA5q6HXv4CxeL01j+ZydCImS
 18hBErMyjA7Lz0GVlhEZgIaloNQDuUikZCsmmOOYpwcXiwYukCU1ZRr529G48YEi3iFwfE2z8k7
 niFmE7g7uc9zrF5FQQDIII8+GMNoNg/K4zoCOVirzLYNX7k1ZtxeKDgAuDhVWnyttQcszEncaeQ
 013igyPJv/0fKcduc/9Eibo/xNL6VG3S9IkWzKdLofZPKEty/sh0Qg9ZM+00DPf153gRwbnEPEo
 Vsam0mJ2ZwgijfSG+FytwE+EWfmqDAbcnGmxkLX/gdpEUhMpUbKcfXByMQxIIxiRwvCOGrNlqNx
 nepIwr8cR+vOu+oN7cJNJBcSEgIHsxrq/nmaq39II=
X-Received: by 2002:a05:6000:4387:b0:431:1ae:a3d0 with SMTP id
 ffacd0b85a97d-435699810a1mr3695386f8f.25.1768571667158; 
 Fri, 16 Jan 2026 05:54:27 -0800 (PST)
Received: from [192.168.3.33] (97.36.160.45.gramnet.com.br. [45.160.36.97])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435696fbea8sm5433542f8f.0.2026.01.16.05.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 05:54:26 -0800 (PST)
Message-ID: <6168099632390068c8544b48f2e81bf737aa10d7.camel@suse.com>
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>, Richard
 Weinberger <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>, Johannes Berg	
 <johannes@sipsolutions.net>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <danielt@kernel.org>, Douglas Anderson	
 <dianders@chromium.org>, Petr Mladek <pmladek@suse.com>, Steven Rostedt	
 <rostedt@goodmis.org>, John Ogness <john.ogness@linutronix.de>, Sergey
 Senozhatsky <senozhatsky@chromium.org>, Jiri Slaby <jirislaby@kernel.org>,
 Breno Leitao <leitao@debian.org>,  Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet	
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni	
 <pabeni@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Kees Cook	
 <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"	
 <gpiccoli@igalia.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy	 <christophe.leroy@csgroup.eu>, Andreas Larsson
 <andreas@gaisler.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jacky Huang	
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Laurentiu
 Tudor	 <laurentiu.tudor@nxp.com>
Date: Fri, 16 Jan 2026 10:54:14 -0300
In-Reply-To: <83zf6daetu.fsf@black.igk.intel.com>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-14-21a291bcf197@suse.com>
 <83zf6daetu.fsf@black.igk.intel.com>
Autocrypt: addr=mpdesouza@suse.com; prefer-encrypt=mutual;
 keydata=mDMEZ/0YqhYJKwYBBAHaRw8BAQdA4JZz0FED+JD5eKlhkNyjDrp6lAGmgR3LPTduPYGPT
 Km0Kk1hcmNvcyBQYXVsbyBkZSBTb3V6YSA8bXBkZXNvdXphQHN1c2UuY29tPoiTBBMWCgA7FiEE2g
 gC66iLbhUsCBoBemssEuRpLLUFAmf9GKoCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 QemssEuRpLLWGxwD/S1I0bjp462FlKb81DikrOfWbeJ0FOJP44eRzmn20HmEBALBZIMrfIH2dJ5eM
 GO8seNG8sYiP6JfRjl7Hyqca6YsE
User-Agent: Evolution 3.58.2 (by Flathub.org) 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 19 Jan 2026 09:43:36 +0000
Cc: kgdb-bugreport@lists.sourceforge.net, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-hardening@vger.kernel.org,
 linux-serial@vger.kernel.org, netdev@vger.kernel.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 14/19] drivers: hwtracing: stm: console.c:
 Migrate to register_console_force helper
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

On Fri, 2026-01-16 at 14:04 +0100, Alexander Shishkin wrote:
> Marcos Paulo de Souza <mpdesouza@suse.com> writes:
> 
> > The register_console_force function was introduced to register
> > consoles
> > even on the presence of default consoles, replacing the CON_ENABLE
> > flag
> > that was forcing the same behavior.
> > 
> > No functional changes.
> > 
> > Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> 
> Acked-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>

Thanks Alexander!

> 
> Should I pick this up or will you send this with the rest of the
> series?

I'll need a v2, since some things will also change in other parts of
the patchset, so I would wait for the next version.

> 
> Cheers,
> --
> Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
