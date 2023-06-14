Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B06C72FC37
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jun 2023 13:17:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4ADE0C6A61A;
	Wed, 14 Jun 2023 11:17:52 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F698C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 11:17:50 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-bc43a73ab22so812138276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 04:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686741470; x=1689333470;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/t09tdI1hKeXFBl3mW1z4mXFtI09hFjwV3/4CRkA0BA=;
 b=NJa5Mo/SsCrehAturYHySGvDtywWDo7BOp7PMYt8cTf6Ycetl2VVbRWeWGxTO3HUfy
 jDjcZDGGO7HSfH1YWqcbVaOTTmKwhQWdcPHMfVYCUslnZLwFtW3M8gd3w1HUROmbkXxZ
 JStFLHi89rfDB7AB+6rEXkDmfu390Ax4K0UsOJa3OHd2PVWMxgv68IRXnVe5m8HOTm3H
 JE9bBT7MyIb3WCeO+1bizUuWk96M8Y/dbV1mrVRr12AXfz3BCWHbi5mAvevWxuCvliFt
 YDPDXCv3JzpN5nocHSKgHm0rh6a3s+BzkzONxqa8dSqV/r8KN03mnzJSG+cpT5cw0DXr
 A6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686741470; x=1689333470;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/t09tdI1hKeXFBl3mW1z4mXFtI09hFjwV3/4CRkA0BA=;
 b=OHVSQQiNWq8AhTCFssYGfOIGwXQsqoR3M+3raChrXTTonKYUNTY+veIyCvk7yesSHa
 TIMTSGat3JboP+2/vO1rFP99pVgYRGL9CYYYdusY+KfwUGmIaui1R2ZliQ+jCqe0DgkN
 rTGnrkZTbp5e0rlfTinpk08fJ6VbLSW2r55bgNlp6koD2MTiPy9Pby5VwGB1pEEZKs2x
 muHpZXjFRAFaIa09Vtb0QCi0w5MkjwPKVphTz5JHvhkY6oEFQOXv0hk0/AgdPwHn3Tf/
 uVSfgcl9zDt7sU3eWOc0cW+JkXEe7whOwyd885buUPdfaYBN8qnVYw5ZmMExWVTSaqMI
 597w==
X-Gm-Message-State: AC+VfDwYyx4euQQaKSIXlYdLMPge0DO+gWdeVm+iipVnA8svkiN9n1/Q
 ZBohZY+xPoZ619fJ9ojOsLCdftw1w/xt0my4j74q4w==
X-Google-Smtp-Source: ACHHUZ5iHcieZrZoFD02SZ14yhYuZcLT8k/k/P8O58Hyna840pyLj4sPqIEC/1tV9M4aM4UvaotFJX6caTmjf/dl2Zc=
X-Received: by 2002:a25:258b:0:b0:bc8:42db:2c07 with SMTP id
 l133-20020a25258b000000b00bc842db2c07mr1503220ybl.25.1686741469919; Wed, 14
 Jun 2023 04:17:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-pl180-busydetect-fix-v3-0-cd3d5925ae64@linaro.org>
 <20230405-pl180-busydetect-fix-v3-10-cd3d5925ae64@linaro.org>
 <CAPDyKFqxvNxFqLdpj15Gz+zDNT04YzxEAh-svKvRuaM52dCV3g@mail.gmail.com>
 <CACRpkdbg5UXnU=WcQa2HoGH54UK-C8+vU8t+7iLChvd__iJiMg@mail.gmail.com>
 <CAPDyKFoMNPHs3td-UBnqDdEK4i7aHybWfsba796BEXPQC-bzUQ@mail.gmail.com>
In-Reply-To: <CAPDyKFoMNPHs3td-UBnqDdEK4i7aHybWfsba796BEXPQC-bzUQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 14 Jun 2023 13:17:38 +0200
Message-ID: <CACRpkdbYNn0S7AXn_sbPb+o8L_DcffKat=tR0mLtNiBhgy7UEg@mail.gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Stefan Hansson <newbyte@disroot.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 10/10] mmc: mmci: Add busydetect timeout
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

T24gV2VkLCBKdW4gMTQsIDIwMjMgYXQgMTI6MDXigK9QTSBVbGYgSGFuc3NvbiA8dWxmLmhhbnNz
b25AbGluYXJvLm9yZz4gd3JvdGU6Cgo+IEhvd2V2ZXIsIHdlIHVzZSB0aGUgc3Bpbl9sb2NrIHRv
IHByb3RlY3Qgc29tZSBtZW1iZXJzIGluIHRoZSBzdHJ1Y3QKPiBtbWNpX2hvc3QuIEluIHRoaXMg
Y2FzZSwgdGhlIG1tY2lfY21kX2lycSgpIGlzIHVzaW5nICJob3N0LT5jbWQiIHRvCj4gdW5kZXJz
dGFuZCB3aGV0aGVyIHRoZXJlIGlzIGFuIGFjdGl2ZSBjb21tYW5kIHRvIG1hbmFnZS4gV2hlbiB0
aGUKPiBjb21tYW5kIGhhcyBiZWVuIGNvbXBsZXRlZCwgd2Ugc2V0IGhvc3QtPmNtZCB0byBOVUxM
LgoKSG0gcmlnaHQuLi4KCkknbSBsZWFuaW5nIHRvd2FyZCBzb21lIGNhdGNoLWFsbCBsaWtlOgoK
aWYgKCFob3N0LT5jbWQpCiAgc3RhdGUgPSBNTUNJX0JVU1lfRE9ORTsKCmFzIGlmIHRoZXJlIGlz
IG5vIGNvbW1hbmQgZ29pbmcgb24gdGhlbiBzdXJlbHkgbm90aGluZyBpcyBidXN5IG9uIHRoZQpo
b3N0IGNvbnRyb2xsZXIuCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
