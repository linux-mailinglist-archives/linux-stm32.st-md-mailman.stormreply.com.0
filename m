Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5B17E1D01
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Nov 2023 10:08:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C74CAC6DD6A;
	Mon,  6 Nov 2023 09:08:31 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E05EC6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Nov 2023 13:29:25 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-41cc537ed54so11023971cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 03 Nov 2023 06:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1699018164; x=1699622964;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=f5hQXxQSZxO3OZcCJDZkPQHyyuV8tvUWsRYcmXkePgE=;
 b=DblWsi6Yvo62Ec8FEqVilLKBdt3q5sjnIlcQNSeSNl7FEzTIi+E0OSG6lVc/oDaVQr
 axUI4XtyXfIFkaBuSmiVvhDatxv2RNcCxB46DEYG2JDF6A6DuT+0JGGOnA3/PwBmVfbM
 Deo0/jfun42g5W2hk9HMhuFOSWU6SABO2DiVsqMmG4jOs8/vAhl0h5BoGoTbwq/MsWrT
 FkWO2trQB/zVHd5meAw9937TA+Un8xwz0ktnVbKm85VZ9vAaxmq9AdAQdT3xXdReVazS
 yowhROGIlLJzi3l3ZwEj8rtUC65e3MasuktI+smeIWOiTh/4J6H4H3eVOUd5Gql9SVFg
 70Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699018164; x=1699622964;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f5hQXxQSZxO3OZcCJDZkPQHyyuV8tvUWsRYcmXkePgE=;
 b=leM4anebc+MuKH/qA7XhuU15jJiyut7J8jU1ITK0MbP/8IBsYGUZamoShLw0uH7Ng1
 EY/4WifnuZyeKy4NZXeGTloP3HF2DHHDpC/2eDKGYDixuLuve3sXCXvDZloJ0oKXtdxH
 dlldIw+uYGIq0AcVzsfGZseoVJUHrrZ1cq2u23RYFltXQ/7Jej++t1ni8XZBjGAJW9tv
 xM9gKFFjrh+RrQAWMEJugGXjhPxS++5DsBS8mgu30aYCEjpPmCqvVsKXc4fYYoRqscA5
 VEpDx9Xb2qiP5OYuPGHju3TCfa2I2PhjMx4DfhpH5bgNQNOsCAykB8Kpd8TiRBYvoW/d
 6lGg==
X-Gm-Message-State: AOJu0YxPN29yYFD0n5iPZ0SA7MUDbOFuwfRS1A54/zdFtXz0s2JTYrNw
 xSAJ/SO2AQXvDQFEjXMzlekscg==
X-Google-Smtp-Source: AGHT+IEn5wRuUs2lNs9myO4AF2zBH6YUvvrm/OBfPI7RX6oZHVthZK736BXDD9Z+YCw0VljCX13Q1Q==
X-Received: by 2002:ac8:5b89:0:b0:417:b901:91a7 with SMTP id
 a9-20020ac85b89000000b00417b90191a7mr27765637qta.24.1699018164054; 
 Fri, 03 Nov 2023 06:29:24 -0700 (PDT)
Received: from dell-precision-5540 ([50.212.55.89])
 by smtp.gmail.com with ESMTPSA id
 gb7-20020a05622a598700b00418189b689csm723217qtb.10.2023.11.03.06.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 06:29:23 -0700 (PDT)
Date: Fri, 3 Nov 2023 09:29:12 -0400
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <ZUT1qFieeCby9ALg@dell-precision-5540>
References: <20231102193722.3042245-1-ben.wolsieffer@hefring.com>
 <20231102193722.3042245-4-ben.wolsieffer@hefring.com>
 <20231103-recognize-unwashed-b8f1a83fe851@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231103-recognize-unwashed-b8f1a83fe851@spud>
X-Mailman-Approved-At: Mon, 06 Nov 2023 09:08:29 +0000
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/5] dt-bindings: spi: add stm32f7-spi
	compatible
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

Hi Conor,

On Fri, Nov 03, 2023 at 12:50:53PM +0000, Conor Dooley wrote:
> On Thu, Nov 02, 2023 at 03:37:20PM -0400, Ben Wolsieffer wrote:
> A wider range of supported word sizes and some additional buffers,
> implies that the F4 could be used as a fallback compatible. Does the
> register map change incompatibly in the process of widening the FIFOs or
> something like that?

Yes, the F4 has a single bit to select 8 or 16 bit word size, while the
F7 uses four bits to select an arbitrary word size from 4 to 16 bits.
This series supports the packing mode, to allow sending two <=8 bit
words with a single write to the FIFO, but even if we didn't want to
support this feature, the F7 would require setting the FRXTH bit (not
present in the F4) when using <=8 bit word sizes.

> 
> Cheers,
> Conor.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
