Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 338665F56D9
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Oct 2022 16:56:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8E44C63327;
	Wed,  5 Oct 2022 14:56:53 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72928C63324
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Oct 2022 14:56:52 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id s21so569180qtx.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 05 Oct 2022 07:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VL0rszw+X7VH9Vs2enoudeRpBA9RJgrDEJBIgJDq1Ms=;
 b=BBHGKXQ/s4dOW1mA1++ZBqxzDyAiMLmeKzCtMSr/doDO7E11bceDzRdNLmsi9LE5Oq
 qwEPuiYF6Mr4AKw18d4eTre2AUrjbToWoT4Q/TG81YvRgKKrclhtkwyAyzRVEnz1HQn0
 VuRh6OQeauJiB2ZGy9nUMT2ZhLghHTNi+KtWvYkruNPoqnUrkdCZkd4hB4fu6z10ABJe
 d9Ra7Z6w08KOopAibqTsO7uRjcSb1nqb8CMJc9UjSrV+ODJJ820ElsmOB3PJK2DekGgy
 l3u1zxgDE26i+GgM5Qt2HMkXJw/BFKCPZQiEMFYnneREGCCGUO6an33YBPMU6NKxgfQX
 6kGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VL0rszw+X7VH9Vs2enoudeRpBA9RJgrDEJBIgJDq1Ms=;
 b=bqjYrdgSShEC2N7NMWRc6SsaGE1EoHF5lqs6SfprlVxhoBKzgCFK7A0zPEifiEj/JI
 QIolJZ1QF5qegmSFLw19B/1ZrdaPr6e2vNJz+G1uPmFYrDzv2D9JoyhZQvr/Tew/8C1p
 5MBg0lquGJf3222tMZqEv5zqM2JtJ3T6f9NK3ug8UXdCfupKsN+YrDlACbgUPHkqBVnm
 poybjlmYPqFCpXaVE1w9FonufS/UAY31COTtIq2i7g5gJ+PzKjpovuJPzDsvzFymxkaQ
 Uxl5Y8PZrRXpqeybQs7is34/XWBJi+E1x5x4aY5iNt99+wD4+cndvj66uEWdJgeXfbQU
 K6Og==
X-Gm-Message-State: ACrzQf0B8T8GvOM1WjBEzAxmh7YjYQ9mfjNrFcsGvOSUPHbVbWl78Jd5
 O1HIfag2e+O0dCFtwT/8g/JtBtRV8qMnvcY5/NU=
X-Google-Smtp-Source: AMsMyM4vVpwYW06RqZEG0YuRwm5ipuue7su59HIMb3pS7vj47CR5mMNY0KOZKzJlEodWLd10zi+UF1IaVTPJ3uisQlo=
X-Received: by 2002:ac8:5e07:0:b0:35c:e7fd:1e94 with SMTP id
 h7-20020ac85e07000000b0035ce7fd1e94mr24098816qtx.384.1664981811333; Wed, 05
 Oct 2022 07:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221005133120.50483-1-olivier.moysan@foss.st.com>
 <20221005133120.50483-4-olivier.moysan@foss.st.com>
In-Reply-To: <20221005133120.50483-4-olivier.moysan@foss.st.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 5 Oct 2022 17:56:15 +0300
Message-ID: <CAHp75VffeeP+_nX86faEbnJFH51kGA2fUcJgqp1_U8EsbRrD9w@mail.gmail.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Wan Jiabing <wanjiabing@vivo.com>,
 linux-kernel@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, nuno.sa@analog.com,
 Paul Cercueil <paul@crapouillou.net>, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 3/8] iio: adc: stm32-adc: add stm32mp13
	support
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gV2VkLCBPY3QgNSwgMjAyMiBhdCA0OjM2IFBNIE9saXZpZXIgTW95c2FuCjxvbGl2aWVyLm1v
eXNhbkBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4KPiBBZGQgU1RNMzIgQURDIHN1cHBvcnQgZm9yIFNU
TTMyTVAxM3ggU09DcyBmYW1pbHkuCj4KPiBPbiBTVE0zMk1QMTN4LCBlYWNoIEFEQyBwZXJpcGhl
cmFsIGhhcyBhIHNpbmdsZSBBREMgYmxvY2suCj4gVGhlc2UgQURDIHBlcmlwaGVyYWxzLCBBREMx
IGFuZCBBREMyLCBhcmUgZnVsbHkgaW5kZXBlbmRlbnQuCj4gVGhpcyBpbnRyb2R1Y2VzIGNoYW5n
ZXMgaW4gY29tbW9uIHJlZ2lzdGVycyBoYW5kbGluZy4KPgo+IFNvbWUgZmVhdHVyZXMgc3VjaCBh
cyBib29zdCBtb2RlLCBjaGFubmVsIHByZXNlbGVjdGlvbiBhbmQKPiBsaW5lYXIgY2FsaWJyYXRp
b24gYXJlIG5vdCBzdXBwb3J0ZWQgYnkgdGhlIFNUTTMyTVAxM3ggQURDLgo+IEFkZCBkaXZlcnNp
dHkgbWFuYWdlbWVudCBmb3IgdGhlc2UgZmVhdHVyZXMuCj4KPiBUaGUgU1RNMzJNUDEzeCBBREMg
aW50cm9kdWNlcyByZWdpc3RlcnMgYW5kIGJpdGZpZWxkIHZhcmlhbnRzCj4gb24gZXhpc3Rpbmcg
ZmVhdHVyZXMgc3VjaCBhcyBjYWxpYnJhdGlvbiBmYWN0b3JzIGFuZCBpbnRlcm5hbAo+IGNoYW5u
ZWxzLiBBZGQgcmVnaXN0ZXIgZGl2ZXJzaXR5IG1hbmFnZW1lbnQuCj4KPiBBZGQgYWxzbyBzdXBw
b3J0IG9mIG5ldyBpbnRlcm5hbCBjaGFubmVscyBWRERDUFUgYW5kIFZERFFfRERSLgoKZm9yIG5l
dwoKSSBoYXZlIGEgZMOpasOgLXZ1IHRoYXQgSSBoYXZlIHBvaW50ZWQgb3V0IGFsbCB0aGVzZS4u
LgoKLi4uCgo+ICAgICAgICAgc3RydWN0IHN0bTMyX2FkYyAqYWRjID0gaWlvX3ByaXYoaW5kaW9f
ZGV2KTsKPiAgICAgICAgIGludCByZXQ7Cj4gLSAgICAgICB1MzIgdmFsOwo+ICsgICAgICAgdTMy
IHZhbCwgbXNrID0gU1RNMzJIN19BRENBTERJRjsKCkl0J3MgYmV0dGVyIHRvIHNwbGl0IGFuZCBy
ZW9yZGVyIGxpa2UKCiAgICAgICBzdHJ1Y3Qgc3RtMzJfYWRjICphZGMgPSBpaW9fcHJpdihpbmRp
b19kZXYpOwogICAgICAgdTMyIG1zayA9IFNUTTMySDdfQURDQUxESUY7CiAgICAgICB1MzIgdmFs
OwogICAgICAgaW50IHJldDsKCi4uLgoKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2Vf
aWQgc3RtMzJfYWRjX29mX21hdGNoW10gPSB7Cj4gICAgICAgICB7IC5jb21wYXRpYmxlID0gInN0
LHN0bTMyZjQtYWRjIiwgLmRhdGEgPSAodm9pZCAqKSZzdG0zMmY0X2FkY19jZmcgfSwKPiAgICAg
ICAgIHsgLmNvbXBhdGlibGUgPSAic3Qsc3RtMzJoNy1hZGMiLCAuZGF0YSA9ICh2b2lkICopJnN0
bTMyaDdfYWRjX2NmZyB9LAo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wMS1h
ZGMiLCAuZGF0YSA9ICh2b2lkICopJnN0bTMybXAxX2FkY19jZmcgfSwKCj4gKyAgICAgICB7IC5j
b21wYXRpYmxlID0gInN0LHN0bTMybXAxMy1hZGMiLAo+ICsgICAgICAgICAuZGF0YSA9ICh2b2lk
ICopJnN0bTMybXAxM19hZGNfY2ZnIH0sCgpGb3IgdGhlIHNha2Ugb2YgY29uc2lzdGVudCBzdHls
ZSBJIHdvdWxkIHB1dCB0aGlzIG9uIGEgc2luZ2xlIGxpbmUuCgo+ICAgICAgICAge30sCj4gIH07
CgoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
