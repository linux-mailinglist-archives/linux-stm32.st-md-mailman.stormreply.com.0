Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BC570269F
	for <lists+linux-stm32@lfdr.de>; Mon, 15 May 2023 10:07:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 974B7C6A613;
	Mon, 15 May 2023 08:07:16 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9323BC6A60A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 May 2023 08:07:15 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-307d20548adso2554791f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 May 2023 01:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684138035; x=1686730035;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bsIl2tBEZFLvN9jaKyeyB/Ks1/R1v4Um4l50iZvHxR0=;
 b=TBQY0qMgP4c4gh43l0Hx3lFSsR+g0yVJn1G1ruyjZjDnnB5C7p4SbIv505uE1qzEsb
 brtgrMr0mO6BmO0zJye4hO4wPXDWfU3WR8+I/QbH8FDe/ilLqDkSOZppYhserEQIupY0
 y8DtY7/n/FD/jky436ziH8k8Y/mNMV/BqaiPuZNQxWqeYaV/XLb74gVf00shICVoqeog
 TiKq8yLvKVvDjoc9DpAs3ApU7Y6dmnrUZyuVJdUg9rWuyd86sv7+Y2lfdDMrbls3b4vY
 gYS7skJi226pvkaif9InL1h/zh72AByA2uuk/4cj9bEG7jJ9DqHz5kFLZSHIE3vlbpMK
 5p4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684138035; x=1686730035;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bsIl2tBEZFLvN9jaKyeyB/Ks1/R1v4Um4l50iZvHxR0=;
 b=SilnrDUnZlW1b2NBgpR8lGidjJR4EfBuv3nelLMpKyTe03MZSQl6FYFW/4iwIqpoyf
 ucrQ2VlrKg4Tr/9qUoWkbBRB7350QHEwI7LA/1+nWG74k801plnwJxMwFUzlNA707kUJ
 WP1JT5MVMDb617mrdwk7WJhZUSxcmiEWXOqmATMv6bk4NHyNAdyeyID8SFDath9MvlW8
 5mrgd2tmMb/7ewQD5C/v7PtpLgxXkNz4GpmC+jlpfbzweUX5hE2b/y/yO9+xGlrgOeGC
 DkSv6oL8RIQFsBtVq82yw1IKkpxpJvn4zrd4d2kW8xlBSyXMeFAmZlfbOObSDlHuTMnr
 ElwA==
X-Gm-Message-State: AC+VfDwYjOmADDT3S07ypE1vpHvxUrBDQNz3lEzAUfbVrZ3kshw5wKYr
 PyFsW1+340gfOh324dFBLmqQCA==
X-Google-Smtp-Source: ACHHUZ489ZDEEhCILWpUTqT8tGoj23LTTLL8r1MI0DyYQW9tIN9+CD4vGARd2EX+7OzuIixQZUA5Ug==
X-Received: by 2002:adf:edd2:0:b0:306:4438:17f6 with SMTP id
 v18-20020adfedd2000000b00306443817f6mr21575277wro.40.1684138034967; 
 Mon, 15 May 2023 01:07:14 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 b2-20020a5d4d82000000b003078681a1e8sm28449102wru.54.2023.05.15.01.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 01:07:12 -0700 (PDT)
Date: Mon, 15 May 2023 11:07:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: yannick.fertre@st.com
Message-ID: <a1f22987-60cf-4d82-a711-ea1c532b7687@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
Cc: linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [bug report] drm/stm: support runtime power management
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

Hello Yannick Fertr=E9,

The patch 35ab6cfbf211: "drm/stm: support runtime power management"
from Jun 3, 2019, leads to the following Smatch static checker
warning:

	drivers/gpu/drm/stm/ltdc.c:940 ltdc_crtc_mode_set_nofb()
	warn: pm_runtime_get_sync() also returns 1 on success

drivers/gpu/drm/stm/ltdc.c
    937 =

    938         if (!pm_runtime_active(ddev->dev)) {
    939                 ret =3D pm_runtime_get_sync(ddev->dev);
--> 940                 if (ret) {

Yep.  Better to use pm_runtime_resume_and_get().

    941                         DRM_ERROR("Failed to set mode, cannot get s=
ync\n");
    942                         return;
    943                 }
    944         }
    945 =


regards,
dan carpenter
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
