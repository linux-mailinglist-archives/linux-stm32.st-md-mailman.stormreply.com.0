Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E39ED7F7029
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Nov 2023 10:41:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A76FC6B47C;
	Fri, 24 Nov 2023 09:41:25 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCBC4C6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Nov 2023 09:41:23 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-da41acaea52so1525318276.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Nov 2023 01:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700818882; x=1701423682;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IRu68hLahwSm/CKHHJmilMs8h1j/3FBhjl9GLsq2RiM=;
 b=uRYbxnxkysFsRF56SLeRWPmwr31rIQK2SulMQD/iYiiYmJseZo13843Qx0DNUIw99N
 +HVOvDMAs5PSsO9AJ6GqjKDtM50DIeON/dSwVXSk7m/BdKu7Mw4pKy3rWSL4+a84tqRT
 Nw/dYmqyWW3JAJhikgAp4bZS+NLMDLf8pGO3vgk7MzwyC+wsE4TqpGHPrVTcKejLkScE
 dEAEIibscfgCkpWn0ermmZ29XS7BivbFgHihmeGcTXEv/tRPuwx74ZMppv8/EAfURnvZ
 Jh7/HVB/dzY9JoSFtn5GYezQyYJyWjp22RjS1P75LqOs5SfBI0/PYnZtnMTQ4ALa7tuo
 B2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700818882; x=1701423682;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IRu68hLahwSm/CKHHJmilMs8h1j/3FBhjl9GLsq2RiM=;
 b=AIMfAvWvXrY+t/CbKR2R9X6lrSGdRKkGOvlZ61R/eOtcffVGXZ35hOlRpR/gXMhXWW
 yzNnaOfTQYMzLAlr+b0k+xDAc9dCEIEAlKkt/GZ+4aE7alJP4NiyOjJ3ULuSFlPVReD7
 Dhupa3VIu2IZ1Mp8pIiVH2ayK3GdbR4Ym+gBuyE9Y+G77wTetUJgHeBJfeAp4HlJpDdW
 H579bcjXHCxapGBuZZMv003JGFFJ9g5etQsY00NsuZu6rU3jyLnRI4egDaNV+yI4oxql
 jUt3enRnZqTutNoa/f+9oEkTd+uD1YMxjt77AkpsmqQl4AWrZhdJbdO2hR6GQ+dwNgt7
 uHoQ==
X-Gm-Message-State: AOJu0YytIG+dcWpG9gESvs6n6Kcjvr8sS/GasNQFf291tcbhqacFImSX
 ZMtDosjD5JWRY+IpvNHAEoUOXoO9WQDOuNZOSpochQ==
X-Google-Smtp-Source: AGHT+IGlF+raSFjKvRmiW4zZYIcSoOVcE2p5f7PD+DEntXiQwO15zcN62FbfmUIaAOYbJUmONEXN1P/CnC715Ug6TcA=
X-Received: by 2002:a25:346:0:b0:db4:6725:a0d0 with SMTP id
 67-20020a250346000000b00db46725a0d0mr958244ybd.49.1700818882595; Fri, 24 Nov
 2023 01:41:22 -0800 (PST)
MIME-Version: 1.0
References: <5ce023a8-db0c-13a9-be42-09e3348ca44d@omp.ru>
In-Reply-To: <5ce023a8-db0c-13a9-be42-09e3348ca44d@omp.ru>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 24 Nov 2023 10:41:11 +0100
Message-ID: <CACRpkdbKJ4KRn3mjjuruGH1w8E+ghT-NJ07Nh8Ayx+dTCw88oQ@mail.gmail.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: return errors from
	stm32_gpio_direction_output()
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

T24gV2VkLCBOb3YgMTUsIDIwMjMgYXQgOTozNOKAr1BNIFNlcmdleSBTaHR5bHlvdiA8cy5zaHR5
bHlvdkBvbXAucnU+IHdyb3RlOgoKPiBJbiB0aGUgU1RNaWNyb2VsZWN0cm9uaWNzIFNUTTMyIGRy
aXZlciwgc3RtMzJfZ3Bpb19kaXJlY3Rpb25fb3V0cHV0KCkKPiBpZ25vcmVzIHRoZSByZXN1bHQg
b2YgcGluY3RybF9ncGlvX2RpcmVjdGlvbl9vdXRwdXQoKSBmb3Igbm8gZ29vZCByZWFzb24uCj4g
TGV0J3MgcHJvcGFnYXRlIGVycm9ycyBmcm9tIHBpbmN0cmxfZ3Bpb19kaXJlY3Rpb25fb3V0cHV0
KCkgdXBzdHJlYW0uLi4KPgo+IEZvdW5kIGJ5IExpbnV4IFZlcmlmaWNhdGlvbiBDZW50ZXIgKGxp
bnV4dGVzdGluZy5vcmcpIHdpdGggdGhlIFN2YWNlIHN0YXRpYwo+IGFuYWx5c2lzIHRvb2wuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBTZXJnZXkgU2h0eWx5b3YgPHMuc2h0eWx5b3ZAb21wLnJ1PgoKUGF0
Y2ggYXBwbGllZCEKCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
