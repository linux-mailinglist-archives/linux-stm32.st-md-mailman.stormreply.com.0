Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B72E81CADB
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Dec 2023 14:46:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 358D0C6C820;
	Fri, 22 Dec 2023 13:46:48 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DDB8C6B477
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 13:46:46 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-552d39ac3ccso5367491a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 05:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703252806; x=1703857606;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JOK6D504CLxxdHQASJ1VcjUbwJSzejSUsInCLwhpoRo=;
 b=fTJwAYUBctkRuu6JoUULXi4pnzSg8jtgWnaUOOSQPCukdwKBhK75xSnZ2NTJvphAc8
 wdHZzEas/wG5NzI8T0PgER2tjxykldelNtbvueZULaB0C2ahmqEdJlzEZSd5EykoqmAi
 vn1jIjw8a7wggjjWnuaqAqc0QwfwhZoftbkQw97AUgEvZBJVOAtRSzGX9Iuqkw8d8i5A
 I/aQVdURc258IU4acGsFpxDt6ZuPruc/o/3JWM8+16CS7mzasqhf75Kboj0mIb7KZioV
 IVzVMJG11hXux3S6FEXrgPpAn+y1ImsKr5j8gHJVCbyvHbHZXufIXLGJE2L0sGdIaQBA
 4QIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703252806; x=1703857606;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JOK6D504CLxxdHQASJ1VcjUbwJSzejSUsInCLwhpoRo=;
 b=H+ohWsemYJ1BYIJeACHoBAPfgcPoIOumslCFkiVmZP6olrKqhcyi1PqrhOW83mHwOh
 J1Br8iDfLmk3Tj2IxLb9Hd3qESec6ltwPwAbp+fYf1TRtsqIPxpDN2Xw8B2Rxdk+z4Zl
 D2DLGmU7PmXaOQ6SwJJvzq4RbsoXuUZns37kYgACb/bzpNB0Etnz3gATU0eie8wjZnUj
 mJdYP7rlsawlTAYND81LRextsR/+dZphYDIH0q3S/ZoXB+qBVo9I6xk2WadFjoHkh6Vj
 ymBEJrPCMuWk+o6r7Aeu7t6m+DNSkJH2mfEdBrdGfQi3c6YUv/sPGn0ZvbcvDnH+SCEs
 vXlw==
X-Gm-Message-State: AOJu0YwjJSfpAtYTBsI50/mOquaGnzT9AT9vRc5lvCjZkHIElGyouaU7
 g9BQzHKeM+NlCOBm9hr8cM4=
X-Google-Smtp-Source: AGHT+IHpGwliTuOmKdzZmqiC/pmk0MykrWoYkUFYiUXU7Q5g5tSTsl17ntCzLp3eQVTtMPr2eTDZ6w==
X-Received: by 2002:a17:907:91ce:b0:a23:8a32:466e with SMTP id
 h14-20020a17090791ce00b00a238a32466emr1572653ejz.0.1703252805816; 
 Fri, 22 Dec 2023 05:46:45 -0800 (PST)
Received: from skbuf ([188.27.185.68]) by smtp.gmail.com with ESMTPSA id
 ez11-20020a056402450b00b005532f5abaedsm2589708edb.72.2023.12.22.05.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 05:46:45 -0800 (PST)
Date: Fri, 22 Dec 2023 15:46:43 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Lucas Pereira <lucasvp@gmail.com>
Message-ID: <20231222134643.undeg7ruu6ptqisq@skbuf>
References: <20231218162326.173127-1-romain.gantois@bootlin.com>
 <0351C5C2-FEE2-4AED-84C8-9DCACCE4ED0A@aol.com>
 <20231222123023.voxoxfcckxsz2vce@skbuf>
 <CAG7fG-bDdtTxWkv8690+LHE5DVMKUn_+pQGsFVHxjXYPrLnN_w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAG7fG-bDdtTxWkv8690+LHE5DVMKUn_+pQGsFVHxjXYPrLnN_w@mail.gmail.com>
Cc: Richard Tresidder <rtresidd@electromag.com.au>,
 Pascal EBERHARD <pascal.eberhard@se.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Sylvain Girard <sylvain.girard@se.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Household Cang <canghousehold@aol.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net 0/1] Prevent DSA tags from breaking COE
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

On Fri, Dec 22, 2023 at 10:22:21AM -0300, Lucas Pereira wrote:
> Dear community collaborators,
> 
> First of all, I would like to thank you for the prompt response and
> the suggestions provided.
> 
> We conducted the tests as indicated, but unfortunately, the problem
> persists. It seems to me that if it were a Checksum-related issue, the
> behavior would be different, as the VPN and communication work
> normally for several days before failing suddenly.
> 
> We have observed that the only effective ways to reestablish
> communication, so far, are through a system reboot or by changing the
> authentication cipher, such as switching from MD5 to SHA1.
> Interestingly, when switching back to the MD5 cipher, the
> communication fails to function again.
> 
> I am immensely grateful for the help received so far and would greatly
> appreciate any further suggestions or recommendations that you might
> offer to resolve this challenge.
> 
> Sincerely,
> Lucas

Are you responding to the right thread? This is about on-board Ethernet
switch chips attached to Synopsys MAC hardware IPs.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
