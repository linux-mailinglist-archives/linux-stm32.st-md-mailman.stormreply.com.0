Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05946B1DB30
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Aug 2025 18:01:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF5DFC36B15;
	Thu,  7 Aug 2025 16:01:00 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C174C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Aug 2025 16:00:59 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-458aee6e86aso7295255e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Aug 2025 09:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754582458; x=1755187258;
 darn=st-md-mailman.stormreply.com; 
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Dr6FBHzwX3eTyKfHZchP63hrZQ6u8tw7ZAjbpylBYI0=;
 b=sojMCdNvM0yadX3hfenneVIXaX2usc+NVpFRjgA3cSqOX8ICXfOEGK/zVbsgQ9kYuH
 YkIf4e+6QjtH/BgH3YdAFTyh64e6e5KXItKoM3hYBCd+gkcc+wYaxyveMMOiXW39k9as
 RH5MIDJXMfM9Nep68W7hKi7UiefnS67SnjZ404dso796n3LQ31KcVX4BZwy0yZ+TXi0l
 0mcbNQ3QGudbreJikUGDd9UcE2V/CAzfbnUBxa2G/DIPhRBy9zF7Dl5Cbfp+Z6TJJQA3
 0lDu6oYNvcvGH8S4/HeUQviBKuHYHT0A4FpDNl5ftyAuM1cflGHZEmnJvRXfOSYSPQ2N
 tszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754582458; x=1755187258;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Dr6FBHzwX3eTyKfHZchP63hrZQ6u8tw7ZAjbpylBYI0=;
 b=RK/ILUXOH8xIyphxntiq8YxSRfypH2t3zl6TEaauj3vXgfsGYtmaKPM7hgXv25j+RI
 WpBIXqv8vhXwrpQ2fmVUWGHCXq9P54Qgz5tov0LWw+2bFfA7ekpMcBJg7vdDAC0am1c9
 +gLK3wLcdCB74LazPb4kH8//pY5EsPh7A0sJl/F0YhEbTQcuWcW8WiL646LpXg3zcslm
 DY+Fs/PHCUODMTFrt5/Yyp34WOMlDiGTErIhJR3Y37MtIuMXI40MgvlKRxIPw5iTvvUx
 md2P5EkV83vMS1yVxrMHiCDxWKZ7Gu4n4nqAa2DQ1FZJOxkKILrOoGWBokP6m5+BDafW
 xA3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBe+1DVbXUAaj3bIRCTK6FwYTF3p56zoQ8BD5jheqq4iAy8vrmu/fNcN5kDURDYfYiwEV+ibWJ7w7lRw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwF3856OPYUnmtsvM/Q3ZrvcjQ0rgU+ZDFLnb4YI+306HWIDA6I
 BehraVsGgUVenqiOJzq0fXPm4wouttqfvcIXNb2hZZvJyQAZmHRU5Okm/zJHYP2DA00=
X-Gm-Gg: ASbGncv9d0NuEYuOgD8qM7BDjP4Fnb/W44Mp+vdVV79dbH8kT4zP/VrdHyeoveh+h6r
 cAZ8PGMjAv7Fff/nAq7IW6QXXQpeLWLuvySlvM8Wz88sB0qqQOuXiDDAiSblPnmbNVzvUtaFqOo
 l45GXPwMOJl4ISHC8XnNyqQ4wvt6ySOeW6Sg3YK2EYZMayrLhHpeGyUEjgcg88s7zGazX+s8364
 42eV00ZjK+E5fWt/CROwRUR3vnvbBlxFT4hdPyqh86BLogCqKifMPCvWpleWRAmketylawdSPtu
 mIqkv1CHYe4Oix0VKCSpcleKaAmNMSwODeEgZlUJ0D+wAAdVtViQy/7IMWklCEmVZBU9lOsQOrG
 AW02uMU8SKJBpgM8VX7fBVplGII4=
X-Google-Smtp-Source: AGHT+IHn1bzy9/wv9h73KG6SIwvZUbFU0uyciZGOD58bVmhqsJOtqDR/PG3xfbeBeTxpvUUB37AwHw==
X-Received: by 2002:a05:6000:258a:b0:3b7:9af4:9c93 with SMTP id
 ffacd0b85a97d-3b8f41c836cmr7155256f8f.35.1754582458154; 
 Thu, 07 Aug 2025 09:00:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-458b8aab8c0sm231753495e9.19.2025.08.07.09.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 09:00:57 -0700 (PDT)
Date: Thu, 7 Aug 2025 19:00:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <aJTNtpDUbTz7eyJc@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-media@vger.kernel.org
Subject: [Linux-stm32] [bug report] media: subdev: Add
	v4l2_subdev_call_state_try() macro
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

Hello Tomi Valkeinen,

Commit 982c0487185b ("media: subdev: Add v4l2_subdev_call_state_try()
macro") from Jul 1, 2022 (linux-next), leads to the following Smatch
static checker warning:

	drivers/media/platform/st/stm32/stm32-dcmi.c:995 dcmi_try_fmt()
	error: 'state' dereferencing possible ERR_PTR()

drivers/media/platform/st/stm32/stm32-dcmi.c
    993 
    994         v4l2_fill_mbus_format(&format.format, pix, sd_fmt->mbus_code);
--> 995         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);

The problem is the v4l2_subdev_call_state_try() macro:

  1965  #define v4l2_subdev_call_state_try(sd, o, f, args...)                 \
  1966          ({                                                            \
  1967                  int __result;                                         \
  1968                  static struct lock_class_key __key;                   \
  1969                  const char *name = KBUILD_BASENAME                    \
  1970                          ":" __stringify(__LINE__) ":state->lock";     \
  1971                  struct v4l2_subdev_state *state =                     \
  1972                          __v4l2_subdev_state_alloc(sd, name, &__key);  \
                                ^^^^^^^^^^^^^^^^^^^^^^^^^
If this fails

  1973                  v4l2_subdev_lock_state(state);                        \
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
then it leads to a crash.

  1974                  __result = v4l2_subdev_call(sd, o, f, state, ##args); \
  1975                  v4l2_subdev_unlock_state(state);                      \
  1976                  __v4l2_subdev_state_free(state);                      \
  1977                  __result;                                             \
  1978          })


regards,
dan carpenter
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
