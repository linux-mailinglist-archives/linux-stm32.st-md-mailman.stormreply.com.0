Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CF091AA09
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 16:57:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6FFFCC71280;
	Thu, 27 Jun 2024 14:57:52 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7683C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 14:57:44 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-718b714d362so4339536a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 07:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719500263; x=1720105063;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=y6zgDkxzVTCfp8FYBsiMFrOvxs4mrOqUQpxmdnl71g0=;
 b=Hpk9g1o8ABiFpqtG9QGKtvysXmdCvCon4w/ozxhaClZXOYqvsis4NpOB5h4OXS4sgr
 3Hrd+tSTTnPz4LViTgMHiYqjw1rocC3VsnGVJyrlU6yYOnhO6wgQojjN1+OoiVL2cGve
 cNFbDD8xKL29Pz47N7DklTyoeW5lDSHdJ6zMBv0jtqlrr4zmahPMFGIXm/3ZRMnjiKge
 n3QVABB5BT/xIHOLmrvb9qkfrFvveiPMqYZNH+7OADYWqeDsCT905O2bk0XvLIJOW/WV
 bCeKg7dW3Y2pARiN/lvN+ga7Tw6mk+UhhvpKZYe15XylhmJe6VkxRmwfSeYCmIgM/vKx
 ka8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719500263; x=1720105063;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y6zgDkxzVTCfp8FYBsiMFrOvxs4mrOqUQpxmdnl71g0=;
 b=Xnglrw2ITszQ5a9B8T5lvNa+f6hK/U3tAAPyCdaXY3LgVeyt4PjQ7U+cTLHZdLp37u
 Xx1vWND1mpYvJuNxLUnlszKb+6T+58hsxoSGbHZ983tOVkBJWDBSr00/pFtbyFUaMwB+
 n+30eRL13ZoTTVQ1seIoDjUGHNqoysdGCg7thUJhqxo6lZ5wegBmjIfFmjtYjDMfcfk7
 ImOXd1/Es5cdIWrXp0A/gFtoF/FAnN3gH2pWJpdgyOW6woWjjgdgeEbcIGkRpPwzaVh9
 8QzBMfo2QStCnLHf1854KFuD7U9eLn2O4IYCO8UkgjnCC6X1buy5+ue8a7CJcEr5wESf
 Ppyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDnd4OxqR+L4ZdbRHVecTE5TjGiTNP74tJrT7PFnvCaH69/hccviJs3/6iJlN/x7H2FqfQPOzxPCvbNqsPDh2jaRTZvJsYM0/DbFG/uIGVrrz2Cai0fXHu
X-Gm-Message-State: AOJu0Yz7+imEgSjHjXkZm2Ds+U4jOSZHxjI558TKGTeVnt+ZSllt09pY
 EOTCZUtustC89Kio7EwMPuewuY9kiGRXmd+xOZc7vl9UVcLu6rhawC2XiGmA+wu7AdHc2kxozs2
 pPO58f4Gj+aSsSep2OQP9YHwz+psfrLpaTcertg==
X-Google-Smtp-Source: AGHT+IGNBAyVWF3V0HW17I0OZdNRl6+47JMbaP/xlj33W1liN9Mo6xOSEbxabe4bXHVGH7BG/VewhSmaNEbyO6I8V/k=
X-Received: by 2002:a05:6a20:6521:b0:1bd:2358:8c8d with SMTP id
 adf61e73a8af0-1bd23588dc9mr6921778637.29.1719500263272; Thu, 27 Jun 2024
 07:57:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240627-ucsi-rework-interface-v4-0-289ddc6874c7@linaro.org>
 <2024062717-foster-document-eb2f@gregkh>
In-Reply-To: <2024062717-foster-document-eb2f@gregkh>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jun 2024 17:57:30 +0300
Message-ID: <CAA8EJprAshnt3YchBv0ssi4Vet9b6oMcf3z8nuRkoZVYNBq64w@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nikita Travkin <nikita@trvn.ru>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 0/7] usb: typec: ucsi: rework glue
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

On Thu, 27 Jun 2024 at 17:54, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jun 27, 2024 at 05:44:39PM +0300, Dmitry Baryshkov wrote:
> > The interface between UCSI and the glue driver is very low-level. It
> > allows reading the UCSI data from any offset (but in reality the UCSI
> > driver reads only VERSION, CCI an MESSAGE_IN data). All event handling
> > is to be done by the glue driver (which already resulted in several
> > similar-but-slightly different implementations). It leaves no place to
> > optimize the write-read-read sequence for the command execution (which
> > might be beneficial for some of the drivers), etc.
> >
> > The patchseries attempts to restructure the UCSI glue driver interface
> > in order to provide sensible operations instead of a low-level read /
> > write calls.
> >
> > If this approach is found to be acceptable, I plan to further rework the
> > command interface, moving reading CCI and MESSAGE_IN to the common
> > control code, which should simplify driver's implementation and remove
> > necessity to split quirks between sync_control and read_message_in e.g.
> > as implemented in the ucsi_ccg.c.
> >
> > Note, the series was tested only on the ucsi_glink platforms. Further
> > testing is appreciated.
> >
> > Depends: [1], [2]
> >
> > [1] https://lore.kernel.org/linux-usb/20240612124656.2305603-1-fabrice.gasnier@foss.st.com/
> >
> > [2] https://lore.kernel.org/linux-usb/20240621-ucsi-yoga-ec-driver-v8-1-e03f3536b8c6@linaro.org/
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Changes in v4:
> > - Rebased on top of Greg's tree to resolve conflicts.
>
> Nope, still got conflicts, are you sure you updated properly?  Patch 1
> applied, but #2 did not.

I feel stupid enough now. I rebased on top of usb-next instead of
usb-testing. Let me spam it once again


-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
