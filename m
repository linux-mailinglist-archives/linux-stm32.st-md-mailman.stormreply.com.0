Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE47154D25
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Feb 2020 21:45:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DF2AC36B0B;
	Thu,  6 Feb 2020 20:45:57 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BFE0C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Feb 2020 20:45:55 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id fa20so497517pjb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Feb 2020 12:45:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7t1ZBW9g5wlG8KTvc0XcPIxcORXLml7TZ0TKspaLkvA=;
 b=pnpruvKDBorWr3jcztgVDdbRdXsvsqu15m0dwVeX/s3+9NXx0sgPrdY4tln0Y4PMJ3
 XQCIbS1Wj5ThCm0Gyg3OxsZL1eEuJo4Irx5wNp4DXa9U22qpC5hw1oAv4p9QIF5Hbw0k
 eZUv5n6dipf2+htVdK10i6RF8bukSzBGyxX0T+KWL8UKzyBbt1Ic2QAYsW+1wRV3PzxM
 YkOOWGVz2ZiDulfWW1CrRvpEnDY+PF7AetVXcfy3R0eddVS3+7ELAyATuzrKfDCobMdZ
 nPokYx/oiCooknJXCTzEc4JcPInIqyso/KiuipcdxcYPR/46nc/eO4c2vDSisTOp4LAr
 wxsQ==
X-Gm-Message-State: APjAAAURMeocnB1Wj7OOTkdQFSh7NfuLD/MfFngJ7GIa8PUqqkpS3hOB
 117JITjYTmnokqHcU23Yqg==
X-Google-Smtp-Source: APXvYqzHq35xMKGzxw/a8MEVmjvvcJB0PiyrMJ12ZZgUVekYH3aTlmRKhxb8cjo4/eurccisZ8lRXw==
X-Received: by 2002:a17:902:5a44:: with SMTP id
 f4mr6093219plm.328.1581021953661; 
 Thu, 06 Feb 2020 12:45:53 -0800 (PST)
Received: from rob-hp-laptop (63-158-47-182.dia.static.qwest.net.
 [63.158.47.182])
 by smtp.gmail.com with ESMTPSA id z10sm275754pgz.88.2020.02.06.12.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 12:45:53 -0800 (PST)
Received: (nullmailer pid 15150 invoked by uid 1000);
 Thu, 06 Feb 2020 19:08:40 -0000
Date: Thu, 6 Feb 2020 19:08:40 +0000
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Message-ID: <20200206190840.GA15088@bogus>
References: <20200204101008.11411-1-olivier.moysan@st.com>
 <20200204101008.11411-2-olivier.moysan@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200204101008.11411-2-olivier.moysan@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, pmeerw@pmeerw.net, knaack.h@gmx.de,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/4] dt-bindings: iio: adc: sd modulator:
	add vref support
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

On Tue, 4 Feb 2020 11:10:05 +0100, Olivier Moysan wrote:
> Add vref supply support to sigma delta modulator.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
>  .../devicetree/bindings/iio/adc/sigma-delta-modulator.yaml    | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
