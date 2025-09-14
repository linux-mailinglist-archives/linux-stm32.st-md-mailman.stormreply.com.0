Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10722B56CEA
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Sep 2025 01:18:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 220BCC3F954;
	Sun, 14 Sep 2025 23:18:29 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C23EC3F953
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Sep 2025 23:18:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A45A84E40727;
 Sun, 14 Sep 2025 23:18:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 653056063F;
 Sun, 14 Sep 2025 23:18:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 627AD102F2A7F; 
 Mon, 15 Sep 2025 01:18:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1757891905; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=5F+Y5lsj2A4Q4W4/06tcxUBfMPFqb0LZREUynVIORa8=;
 b=RwI7gf0f8Yo01366R0vgOnbcnRt3sFACYDElP65fQCY6yRFjMVFh21QOsEWo9W0GRE2sMr
 jtTP1ygS6eDB4QySjm+cYfs9Iz2U5i7UjCOSXhWaTWkORXALKtNOWSBwGR43fPOTXxAWKH
 yL2D2l798C+RSazWUjl9OjP4XmPW+pm6NBZH6dPQZY9PhBDE3qLX12RQZrcjNJQDOKxO/t
 8nyRKNA3+rb1es7fAK3RRVozOKZqjIFY7c5xYoIsq3veiAfATBFNyJWAtIBqTA5DmFgzuS
 qUqw14p4oNTYIzpUrkDbH1x60aA5tqLUXro6MgfabHFOFomfannmH1Qm5WKw9A==
Date: Mon, 15 Sep 2025 01:18:15 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Message-ID: <175789183744.411954.8980801689836032350.b4-ty@bootlin.com>
References: <20250715-upstream-optee-rtc-v1-0-e0fdf8aae545@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250715-upstream-optee-rtc-v1-0-e0fdf8aae545@foss.st.com>
X-Last-TLS-Session-Version: TLSv1.3
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 0/3] Add alarm operation to the rtc-optee
	driver
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Tue, 15 Jul 2025 16:07:12 +0200, Cl=E9ment Le Goffic wrote:
> The optee-rtc driver is used to query the rtc handled by OP-TEE OS
> through PTA (Pseudo Trusted Application) call.
> This serie fixes memory concerns and add alarm operations for the
> rtc-optee driver as the RTC PTA now support them [1].
> =

> For the alarm notification, the OP-TEE OS secure world will be
> able to inform the kernel when a secured alarm will occured
> through a notification sent to a kernel thread waiting in OP-TEE OS.
> =

> [...]

Applied, thanks!

[1/3] rtc: rtc-optee: fix memory leak on driver removal
      https://git.kernel.org/abelloni/c/3e044fa26038
[2/3] rtc: optee: remove unnecessary memory operations
      https://git.kernel.org/abelloni/c/9b9f352d5b02
[3/3] rtc: optee: add alarm related rtc ops to optee rtc driver
      https://git.kernel.org/abelloni/c/96e8fe5b8a88

Best regards,

-- =

Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
