Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D29D99285D
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2024 11:42:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12A53C78030;
	Mon,  7 Oct 2024 09:42:37 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BA81CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2024 07:47:22 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5c46680a71bso710916a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2024 00:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727336841; x=1727941641;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VXgcQt/t3gCBiL6CrVkztXkAMt0TnTUvjHyyD1p//ys=;
 b=PFjRCSZzmu8b0fYBoibfcRgyU6TZmaGn4R8iIsFssPHeoHbgjA7fcZaFMPOqwL7hHt
 6fOezALSG2XA9cfTbV8vZHQmFOqynkqNrVRIY1siFLZWQytzlZDZLL3YRsqcLytwG2yX
 LhkR67y4RRaah/qiPA1QWiZYYeJ8MsbYIDGY/TsvGUXPg5vglawCS2OTt/WGiQIm8jar
 NEFqOkXg8ZQARhabRyCQaUzhlQX/Q6Liu4SFyiLFrn0RiBdU1hUMIoFXOZ0Fe1IWjZ5U
 GrBBxm+eNWwXnDmAUcWCPu81b998WotR/BtRkfVewwcdPLAbBXEteasGwb0JKi1bfHLX
 hF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727336841; x=1727941641;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VXgcQt/t3gCBiL6CrVkztXkAMt0TnTUvjHyyD1p//ys=;
 b=vSPdqvM5lEnPa7uq3Ss6O2sdnT/IAI3ewRALhZqarYkCXmo8RzwW+udL7hnMYCyxAk
 fHratfnXar9jxsitbXK1UEK9SCsMxzCF8Fqfi4smkM7LmTx3dXid1Wt4L3wdxpZtdVD3
 Yzt7g88x9jlM17hTmEAW7+suq9Pt06sKhZ6Gp0+gCP7KtJ8dxUOSLI0dJk6doEB+H+hb
 tLA0zRzotPyU+8ghUwxSX9RFmqBHe8PDBh4W4fpBAmfh3o71SQvxoV5iQ+35H11Y2Z/7
 j86dy/M4wETSC0TtXbn0Ji02+zzxYecPUTBSiuxiTayR3SVTuT04ZjhmDBBzgLygvO2t
 qNIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/lMcGum44xZopd7vbZoYmDedbXx+2jE1MwXAm9caDAIgK16SZ1Yr8HDTW1DZxr+DBVNVA/7OsFOdM2A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwPglTGRE8SBukpwnIlDzhmdwd6deMThlWdLggkBgn87bpmP5OG
 aAtyqgG+eieszAQ1vRnyLdMpwrS+rSt7XgXRWZHZoRhcVUc6XMyA
X-Google-Smtp-Source: AGHT+IEJXaXg4njtPdRpa2+FF2h/xySF67hNU5lrTkwJ03kFktgRk6Pd9eooA6tbBFdzJPIFxUaJFw==
X-Received: by 2002:a17:907:31c9:b0:a83:94bd:d913 with SMTP id
 a640c23a62f3a-a93a03202f3mr572242566b.10.1727336841193; 
 Thu, 26 Sep 2024 00:47:21 -0700 (PDT)
Received: from localhost ([217.151.144.138]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930c8a98sm317428966b.124.2024.09.26.00.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 00:47:20 -0700 (PDT)
From: Oliver Graute <oliver.graute@gmail.com>
X-Google-Original-From: Oliver Graute <oliver.graute@kococonnector.com>
Date: Thu, 26 Sep 2024 09:46:18 +0200
To: Yu Jiaoliang <yujiaoliang@vivo.com>
Message-ID: <ZvURSswZLdAakNU6@graute-think>
References: <20240926031457.3479350-1-yujiaoliang@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240926031457.3479350-1-yujiaoliang@vivo.com>
X-Mailman-Approved-At: Mon, 07 Oct 2024 09:42:34 +0000
Cc: ye xingchen <ye.xingchen@zte.com.cn>, linux-input@vger.kernel.org,
 Scott Branden <sbranden@broadcom.com>, opensource.kernel@vivo.com,
 John Keeping <jkeeping@inmusicbrands.com>, Ray Jui <rjui@broadcom.com>,
 Joel Selvaraj <joelselvaraj.oss@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Andreas Kemnade <andreas@kemnade.info>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Felix Kaechele <felix@kaechele.ca>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1] input: Fix typos in comments across
	various files
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

On 26/09/24, Yu Jiaoliang wrote:
> This commit fixes several typographical errors in comments within
> the driver/input directory. No functional changes are made.
> 
> Detected using codespell.
> 
> Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>

Reviewed-by: Oliver Graute <oliver.graute@kococonnector.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
