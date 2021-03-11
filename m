Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9A83372E9
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Mar 2021 13:42:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8F39C5718D;
	Thu, 11 Mar 2021 12:42:51 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E76BC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 11:24:17 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id ci14so45329014ejc.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 03:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=BigjSlhOeprsXx4neHUCGwnpc3gne5HdTbZQCp0CX+4=;
 b=nALRwWKTtHx0D/2PpdF42HuXoImFMEwHGyPudZGDjhc51D/fin6UjUpFHmJMYm5h0w
 1OpCJO08sS22QWR4LOJry6eJF99zEGlZgWjPjtSxv22vZdzxq0nXumxQ47eURX3ZWMn4
 0aduXxnuj2j1ht3fzHu5YBuUDjH+ySXNx6UgcZu7o4iFcA6IyiZL4De8BV4S68/p9Mqb
 9ph4hZFILllRqF0GOlSaUYiEn5Iu5f5NEbLmbOQY/lBu7iA+GL5Mv3obDg4aYRNiggO0
 7Y6dnC2EupVUPwP6X1AiN8LnLho/Xkyryc3f1wiHkbBDt2frHR/dQc+VNmyDMlsDJiRJ
 EChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=BigjSlhOeprsXx4neHUCGwnpc3gne5HdTbZQCp0CX+4=;
 b=VaPzepczv2L9LWO9k2KzqdR6EjPNqGk5/cpT+yjbP7SgT4XDNLlMovgPQftGdslnwP
 z/HjXILEkJhscLW65z4qCLt7gv9HCGUR1UcxUH55sTIB1UD17YlhCQ7PFzY5Sq/4CEll
 nKtotLin9N1n5QMjBilUGbe48KJiLGpAhmIkK/gbAohfHeS/LWPzBM+Tpuo7fbxYAiTj
 yKGjIupIzFgnd1MQlusvuxiqO/r2DB9ANBOVzb5d8HS78WCVt14HoFdyvfBA1RH3CPav
 WyjwREljMii5eC78GA1RJ5/Lpg7QFEZ6ksJj4rWGdSqsG5PmAwSEYhHEbyte36P4MBAj
 eYdw==
X-Gm-Message-State: AOAM531V03cDYhPpsPjRgfs5i2AfDl3p+exM7VLDvoNv05KBpAvz0MNg
 v7I9D1hNJKl2/hq/Ai64Z/i8BAnZkMASnuXR8aY=
X-Google-Smtp-Source: ABdhPJyh7ZbVklsi5BUCrRjiM7J7HpMvcn3nhMBMr67yz0arbO28f97q4MA/3DjPHvJeyjCyMPgJFYNi3uFRqxMqJvQ=
X-Received: by 2002:a17:907:7014:: with SMTP id
 wr20mr2640860ejb.179.1615461857107; 
 Thu, 11 Mar 2021 03:24:17 -0800 (PST)
MIME-Version: 1.0
From: Yauheni Saldatsenka <eugentoo@gmail.com>
Date: Thu, 11 Mar 2021 14:24:06 +0300
Message-ID: <CADj5-AzOcOBiVXL+QgAPRhMWF+k5WS5TvECOSdDeZPtQHSgvRQ@mail.gmail.com>
To: yannick.fertre@st.com, philippe.cornu@st.com, benjamin.gaignard@linaro.org,
 vincent.abriou@st.com, airlied@linux.ie, daniel@ffwll.ch, 
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
X-Mailman-Approved-At: Thu, 11 Mar 2021 12:42:51 +0000
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [BUG] STM32F469: vblank wait timed out on output to
	/sys/class/graphics/fb0/pan
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
Content-Type: multipart/mixed; boundary="===============2572160123990154752=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============2572160123990154752==
Content-Type: multipart/alternative; boundary="00000000000024232b05bd410622"

--00000000000024232b05bd410622
Content-Type: text/plain; charset="UTF-8"

Greetings!

I've created a bug on bugzilla related to stm32 drm driver:
https://bugzilla.kernel.org/show_bug.cgi?id=212229

My experience tells that personal messaging is more effective, so I've
decided to contact you personally.

Please feel free to ask for additional information about the software and
hardware environment.

Best Regards,
Yauheni Saldatsenka

--00000000000024232b05bd410622
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Greetings!<br><br></div><div>I&#39;ve created a bug o=
n bugzilla related to stm32 drm driver:<br> <a href=3D"https://bugzilla.ker=
nel.org/show_bug.cgi?id=3D212229">https://bugzilla.kernel.org/show_bug.cgi?=
id=3D212229</a></div><div><br>My experience tells that personal messaging i=
s more effective, so I&#39;ve decided to contact you personally.<br></div><=
div><br></div><div>Please feel free to ask for additional information about=
 the software and hardware environment.<br><br></div><div>Best Regards,<br>=
</div><div>Yauheni Saldatsenka<br></div><br></div>

--00000000000024232b05bd410622--

--===============2572160123990154752==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2572160123990154752==--
