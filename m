Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF949C7D02
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Nov 2024 21:36:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9006EC78F91;
	Wed, 13 Nov 2024 20:36:05 +0000 (UTC)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
 [209.85.221.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC6B1C78F90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Nov 2024 20:35:58 +0000 (UTC)
Received: by mail-vk1-f180.google.com with SMTP id
 71dfb90a1353d-50d4a333a87so2999358e0c.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Nov 2024 12:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731530158; x=1732134958;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I/sJfcthCzxrPjuRsj4tX5SjwFr74e9+VRf3E94baG8=;
 b=a4AK1liKn9suskNDd9O7tBfBhnoPOkwFshRDQkiaHz6sgBLYgVklq9nA079HcnULje
 Ye5j2O/XTW9uVLUg5DSTyS7u9M00Af1t27t8HXnz+Aij1HjZGmLCG4SsSd7buseRwfgC
 MipwRjG2O/LYZVVU0kMZjH/VdGTA/glisIEtQY5YUa+CNxOgg8xsl1+h85kE+puRO0++
 2/FF9tpYZgI0Y/cD4N9radYSUzoXeNSVAXhh0CaB+BoDHgHCMt1/18T5ST0lx+e32fhC
 upvEFnLZfKeHMuleTJ9Rz2kFD4rRkEf4T82wp3+XjEUP6A6iJlcf35f5wXuXvuQRnaJ9
 Il/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731530158; x=1732134958;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I/sJfcthCzxrPjuRsj4tX5SjwFr74e9+VRf3E94baG8=;
 b=jHnnse3uTKuDhqKNTQmntzUdFW4/JMEjtIXvhhNQwjDR7kaPGLkVRkBXrK17Gaffkb
 4K0nam6FRXa719bkaphsj+rYzRD3D0pKCMQb32r8PT6AIMWo9UEIXHuMr+mOb43YE3Tq
 IywwOnJfotLQcXEaWyO2Xi6WSI8xmAj4nxsrhw5zzh9Y25zw6rsQ2T4f/gcqRAh4wlo3
 ymskVopv0kwGcilpKF2MScEKUcfq/ZHyXoabOJF11E9qBqc4nUwMXPuZSbZS84ux7Wen
 CbaEnkTanqmw5FBtyN4pYCC13PeOiVFo6ZFrtsvecY2zR4+L6JrqDv6EGWwDsho5Synp
 CtfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW51VR6PVMutJYelG5O/XJugke4EMq2ekjgT/yZpJRnK/ZGQWftxZJSKyke9EKkFmA2eOAVbkbFInXxQQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxHVWSrWsrNcS/08Hrup49Io7YAnC9Iys5vYVNyaadEjnRw1UAf
 kaYhfakSU5u084E6E/YcIiqiKElk+AxFwdU9dl9qnjNj35rB+tlT3TqdXCLt9YTH/9lFcVjYqsT
 IobY705NC/6YKlL/Y4nBAbg9eoM4=
X-Google-Smtp-Source: AGHT+IEIPpn4HHPIF+usA6rtVxhozfZrFa/wVDvJvxg7hmjJzXgeWkot8H8vZh/T4c/n+8NbksBDE/nxMxLWoC2ruMQ=
X-Received: by 2002:a05:6122:168e:b0:50a:caec:70a2 with SMTP id
 71dfb90a1353d-51401bc7d7cmr22823944e0c.4.1731530157648; Wed, 13 Nov 2024
 12:35:57 -0800 (PST)
MIME-Version: 1.0
References: <20241020144736.367420-1-karprzy7@gmail.com>
In-Reply-To: <20241020144736.367420-1-karprzy7@gmail.com>
From: Karol P <karprzy7@gmail.com>
Date: Wed, 13 Nov 2024 21:35:46 +0100
Message-ID: <CAKwoAfoQ1Kt3HqW8jaFCmx1s8zmvSF9aBhNOjyqF47h8T1zmWA@mail.gmail.com>
To: jikos@kernel.org, bentiss@kernel.org, mcoquelin.stm32@gmail.com, 
 alexandre.torgue@foss.st.com
Cc: linux-kernel@vger.kernel.org,
 syzbot+040e8b3db6a96908d470@syzkaller.appspotmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] HID: hid-thrustmaster: add endpoint check
	in thrustmaster_interrupts
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

On Sun, 20 Oct 2024 at 16:47, Karol Przybylski <karprzy7@gmail.com> wrote:
>
> syzbot has found a type mismatch between a USB pipe and the transfer
> endpoint, which is triggered by the hid-thrustmaster driver[1].
> There is a number of similar, already fixed issues [2].
> In this case as in others, implementing check for endpoint type fixes the issue.
>
> [1] https://syzkaller.appspot.com/bug?extid=040e8b3db6a96908d470
> [2] https://syzkaller.appspot.com/bug?extid=348331f63b034f89b622
>
> Fixes: c49c33637802 ("HID: support for initialization of some Thrustmaster wheels")
> Reported-by: syzbot+040e8b3db6a96908d470@syzkaller.appspotmail.com
> Tested-by: syzbot+040e8b3db6a96908d470@syzkaller.appspotmail.com
> Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
> ---
>  drivers/hid/hid-thrustmaster.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
> index cf1679b0d4fb..f948189394ef 100644
> --- a/drivers/hid/hid-thrustmaster.c
> +++ b/drivers/hid/hid-thrustmaster.c
> @@ -170,6 +170,13 @@ static void thrustmaster_interrupts(struct hid_device *hdev)
>         ep = &usbif->cur_altsetting->endpoint[1];
>         b_ep = ep->desc.bEndpointAddress;
>
> +       /* Are the expected endpoints present? */
> +       u8 ep_addr[1] = {b_ep};
> +       if (!usb_check_int_endpoints(usbif, ep_addr)) {
> +               hid_err(hdev, "Unexpected non-int endpoint\n");
> +               return;
> +       }
> +
>         for (i = 0; i < ARRAY_SIZE(setup_arr); ++i) {
>                 memcpy(send_buf, setup_arr[i], setup_arr_sizes[i]);
>
> --
> 2.34.1
>

Any feedback regarding this patch is appreciated. I was wondering if I
should declare an additional u8 array or maybe just do inline
conversion.

Best regards,
Karol
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
