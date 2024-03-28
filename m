Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5C9890B43
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Mar 2024 21:26:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8258BC71281;
	Thu, 28 Mar 2024 20:26:02 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99B6AC6DD96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Mar 2024 20:26:01 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-6ea80de0e97so1018599b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Mar 2024 13:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711657560; x=1712262360;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DjTzWFlNYBOpXQ3CKmgioPdo4KwHiFtc75RCFzmDGfc=;
 b=MsUsS+jHAVoZkyj55GmL36uexpBYF+Lf5ciriDGimWc7botDEvNoKYp93cu0Fv698j
 B1DuUslKAahQbuNZHWYcX/jCf8YgLQoHuPaRQTa76dheagOjmkX9qdwu+9ejnh72oCLS
 U4B8AILL+4VHga0BYraZg3XyYSFsU9dXBpD2HoXSpLWhmaxiOv4voVQy4CcpI+XI38gf
 AlD/53cjU6uEeKApntGf6ZapiAvkKwbs92MImx9dtq4MqGbAU0rBKHn374i61w04VKzp
 7fkYNf+tosXDtJRKAbPHAdtUB8a6JnrNryvVcVB2wFzmnI5zAodWieARx8f5onChKqXY
 UCeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711657560; x=1712262360;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DjTzWFlNYBOpXQ3CKmgioPdo4KwHiFtc75RCFzmDGfc=;
 b=je04Xa9iMsuSQEVKuWWl7q3oHqiOBGClJontwwiclvh7PcgNO+LGSO+uawnHyuXoLq
 k7Ttl8ebRxQRFDqfjPvagpnMZMIV8emJdDZR8PvAK5O2PMH8kVnP/4VqKqUNhOnXNg+G
 8DxugbCK/xOwQ6H7bkAAEyMIm8LaVgmrm8JCxlVpiyUcrodUK3toP+rBjU0eNZ7BJkSC
 8qM0KFOOFpqr18VqDxDmuyrEAc+SdN5/xxA2Mc84g/Z6AdKWxpiByfr9ps6pZBsWkgqg
 2PuG8VM2kTbuz+MCbsRsnU2GVWS0mVYlIxady//cKZud78MoStlrxCwm8bvySD3QM1uw
 Vy8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp2BEXRrm967+V5fm1l3fVnsCVDzpfcJqNKHeG62D7Rb5eAw1Ajjpk59Qh8yGU1PSoi2mDFIyGNUD6zZySflZH/SLSVDtNwwM9DxhdQw8Tm0QktE/Bp7IG
X-Gm-Message-State: AOJu0YxOEh9OVX/sBU2PDc9XEov8RN2i03dKE6TCK+kNbKCNWeu56tuG
 0N1kUsxbslcI+2tpJ7JLY+9/KlVMSokAEXbwjvLlwPOE3fKJzkG2
X-Google-Smtp-Source: AGHT+IEx1w9caaaypQCI9yAm8E6MJQGwAU1nwtoauXZOhkZ6zuitYlyEc3oh95Bbc7PPnl5r2KW7ZQ==
X-Received: by 2002:a05:6a21:3384:b0:1a3:c407:39d8 with SMTP id
 yy4-20020a056a21338400b001a3c40739d8mr288558pzb.45.1711657560070; 
 Thu, 28 Mar 2024 13:26:00 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:493e:82a3:49f9:d88])
 by smtp.gmail.com with ESMTPSA id
 fk12-20020a056a003a8c00b006ea858e6e78sm1795975pfb.45.2024.03.28.13.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 13:25:59 -0700 (PDT)
Date: Thu, 28 Mar 2024 13:25:56 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <ZgXSVB4gsKlhsPCz@google.com>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
 <20240326-module-owner-amba-v1-17-4517b091385b@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240326-module-owner-amba-v1-17-4517b091385b@linaro.org>
Cc: kvm@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Herbert Xu <herbert@gondor.apana.org.au>, Russell King <linux@armlinux.org.uk>,
 linux-input@vger.kernel.org, Mike Leach <mike.leach@linaro.org>,
 Andi Shyti <andi.shyti@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 coresight@lists.linaro.org, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Olivia Mackall <olivia@selenic.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 James Clark <james.clark@arm.com>
Subject: Re: [Linux-stm32] [PATCH 17/19] Input: ambakmi - drop owner
	assignment
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

On Tue, Mar 26, 2024 at 09:23:47PM +0100, Krzysztof Kozlowski wrote:
> Amba bus core already sets owner, so driver does not need to.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
