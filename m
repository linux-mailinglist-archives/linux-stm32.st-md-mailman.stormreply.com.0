Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E314190DC13
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jun 2024 20:59:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A3A2C71282;
	Tue, 18 Jun 2024 18:59:17 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B79F0C5E2D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2024 18:59:10 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52ccb56d5fdso71298e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2024 11:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718737150; x=1719341950;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9MpCHcPoZaGrAFpup9mciJpiv7a+e50VTao5sjCkleg=;
 b=TMssepLuaGL8D6HmF+EyH9pV9FNq6Q9Wo0R4OpdHBmjwrJ3B4M7xkxTAnl+Akr2ycI
 yovNMHvJEBaNSwz3JsjxrvSZ+KJNfvMlfHy1SSt5OTEsowumi8mCCS0bP4OoQ4SCnMzz
 /HbfBo2UuFevhays9Jil0RZzU1cWJcx7V5WGmqCkAkAMYZvcCakeqGLJVMuR+wPmaCd0
 QVGGA+ucQ4SBZhtpq+esLYeZWS1vEVu0fE6ovi0acMI3PE+FcZBCZ4EL5lXUO7sNdG4I
 fKCb80MWXEV4qFsbQ8Iyq/K+eNr0KgkDBYOirP5lHARfuzI3i61cMxxNzRkSz/MedbFc
 dtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718737150; x=1719341950;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9MpCHcPoZaGrAFpup9mciJpiv7a+e50VTao5sjCkleg=;
 b=hZTZka86oPBmEyVB0RG6eSNZ+soE/jkp/RfEmp839RywwTs/1cmGOI7oUU/EcNq0SX
 TO8tm8/4E467OjZEn8/cNP59ZgrnoNj03qwYyw9M18YAMRPboUXl7g2/oeQ8a/gRhCgW
 9eQ7boDDGoaiijTjB8j7CdFIJhXK2+EFGs43CxRFUb7GYB1oqcrbwvlUsg/pEg8TkPtA
 aTqOIEI/uRDkXW2uMa3ta4j6ZEQ7fJhLw/u2piBDxYUWZVXT9jSiX76ktWozTg20YZ+u
 x+AnoTygkJFqHs8ruyXiP4m75yT94W1+zQn1o4wslSQ0HnBdF3H7gUXXx+v2sAo/lmN4
 UOnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtp1pQMauksbHnNjqSHGTxRWy0EQBQF/RgE+hcP3us6zeaGdddPrHTIq8VX06g+GY8wde+GZfBTMvmsOaJT3NEuwOCEqGouCfzBvomkd1juCxdbmxJK8qg
X-Gm-Message-State: AOJu0YwZcMMalSp5/IEOdJi3nOFrcLFDYnZi0KXNrUK4kJLByVVeWKSe
 g+f7dV2J+jVryZXEUe4FyK9Dw0TKTUmk6cgPs0cJKKI+y4BDP56XVPAS3vFyt1w=
X-Google-Smtp-Source: AGHT+IFDr3U/SrLBiO1uPby6Uc8AxM6+e9mp/Lc1MODZwB4YQh4bCUD9hP+ePj9pH4co7aNG+afopA==
X-Received: by 2002:a05:6512:2e7:b0:52c:823f:2a0a with SMTP id
 2adb3069b0e04-52ccaa2c8c8mr327227e87.10.1718737149939; 
 Tue, 18 Jun 2024 11:59:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2889052sm1573443e87.299.2024.06.18.11.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 11:59:09 -0700 (PDT)
Date: Tue, 18 Jun 2024 21:59:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <hgqvyaziumpag5g5ajzupllvpwlz44scma6yu3drmtoqwcwav4@w366suy7c2eo>
References: <20240603-ucsi-rework-interface-v1-0-99a6d544cec8@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240603-ucsi-rework-interface-v1-0-99a6d544cec8@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC 0/7] usb: typec: ucsi: rework glue
	driver interface
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

On Mon, Jun 03, 2024 at 02:24:53AM GMT, Dmitry Baryshkov wrote:
> The interface between UCSI and the glue driver is very low-level. It
> allows reading the UCSI data from any offset (but in reality the UCSI
> driver reads only VERSION, CCI an MESSAGE_IN data). All event handling
> is to be done by the glue driver (which already resulted in several
> similar-but-slightly different implementations). It leaves no place to
> optimize the write-read-read sequence for the command execution (which
> might be beneficial for some of the drivers), etc.
> 
> The patchseries attempts to restructure the UCSI glue driver interface
> in order to provide sensible operations instead of a low-level read /
> write calls.
> 
> If this approach is found to be acceptable, I plan to further rework the
> command interface, moving reading CCI and MESSAGE_IN to the common
> control code, which should simplify driver's implementation and remove
> necessity to split quirks between sync_control and read_message_in e.g.
> as implemented in the ucsi_ccg.c.
> 
> Note, the series was tested only on the ucsi_glink platforms. Further
> testing is appreciated.

Gracious ping for the reviews / comments. My endgoal is to simplify the
command submission interface, allowing us to handle odd commands in a
single function rather than having the code split between sync_write()
and notification handling.

> 
> Depends: [1], [2]
> 
> [1] https://lore.kernel.org/linux-usb/20240521151109.3078775-1-fabrice.gasnier@foss.st.com/
> 
> [2] https://lore.kernel.org/linux-usb/20240531104653.1303519-1-heikki.krogerus@linux.intel.com/
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Dmitry Baryshkov (7):
>       usb: typec: ucsi: move ucsi_acknowledge() from ucsi_read_error()
>       usb: typec: ucsi: simplify command sending API
>       usb: typec: ucsi: split read operation
>       usb: typec: ucsi: rework command execution functions
>       usb: typec: ucsi: inline ucsi_read_message_in
>       usb: typec: ucsi: extract common code for command handling
>       usb: typec: ucsi: reorder operations in ucsi_run_command()

-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
