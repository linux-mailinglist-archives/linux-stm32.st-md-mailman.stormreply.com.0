Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1ADBCC1105
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Dec 2025 07:11:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81C9CC87EDC;
	Tue, 16 Dec 2025 06:11:00 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C11DBC87EDB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Dec 2025 06:10:59 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2a0c20ee83dso25806485ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 22:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765865458; x=1766470258;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/sW7m48+VKPhwN9Rm9Ugqxu1eLioZD54jqqMNJ7yTAA=;
 b=WC2zzlSa9hhIaClUz9hG4f//p/c+KxlNLxhhSNp6h2UaPzEyuH8foymgRmf7GZFM3K
 S0hjdk4ppRsLUKg95bnfA7168y3goTrhrBq9Qyj1QNt8hAcJUcdwxSh4sJCTHXsdfwjN
 Yr4gW0zz74KQVi/TtwTHSj45N45MH2NKDBJOI/loIzGKOJtRb+zJl9waten5R75vAc70
 xcOrem7j3CPz2z5QMfaiG9KYo+kEMmgHCKwuc/CnHwWHqE8AvX33S2g+bVeyAu5AlYlg
 kipq4LmdaxutjcxJCauUmBsjbMn777X2uaG/7OZ8zuGFvyo6vwyRQEbU0+Pg3BKIFur9
 Z2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765865458; x=1766470258;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/sW7m48+VKPhwN9Rm9Ugqxu1eLioZD54jqqMNJ7yTAA=;
 b=ToU8LFTM7T9rhfB1n9YlXDuqmG/86vqmFZzV2e6Eq3o7bQicI36jw+TxhYGm2SK0PF
 EgIRzL7/aWfzZoKZBW5y9VO/no1PeFisOXuF/slehFk8dHvHDLChcpPNj8b11lyGJAgn
 dHNHpgcmK2tZCVieNN8PVhUuWoUXmNerL8gQEegvOOdfeGX4XkXZxrF/usvHqZrqRbme
 qrRdclcrPPVb7/MosXXvQiLRPMiZHIl//qeW3pTsrnXO1xdfXDgnGaG2tT9QADwPcWgB
 N2niqw/UYn1Hu7+kgStaG1djpLr6c2vf3of4L+UQtLorWWSgsnOSGASXl7QVrLtYLSBR
 X7/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9oHnjiHzbvUGKWxSxg5VaR9CVxhFiswRcQimjwsDaOT9AEkAQe7pN+ZtP6rY0F7csdqlTZhBi+d1Etw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzc408s3sU50DNsBAo45Tkg8oUsZuuPfEDfG7KP0FuxoIaROlTc
 QdYMiFuHhrMQI09Skm6Y6PvJ4YgT5OM/9agALDJUI+Zwoi4ZRIeXHSk0
X-Gm-Gg: AY/fxX777e1bu2bTz3L5ZWrvuS6zwEBMhNRjbuheMXyAYHTDQ1aUqV0YLgoLHVoSoMF
 lIYZcbbtmiHOn98Dtp7HNmF984RVebY7s+ubfK6Vse524AUpwtqSfjHh+PqPY+zbdigP2KW0fp/
 itmLbLIfSMuZzNi5m6ulLiu2Vq1w9hOvCGJZJjKKRh6NXrkspaXcHJShcj07aUYJuxzBEQuVUVf
 0MolRjNRzyjzuu5Q5pWOqFOlQP0co8XSXQRUyHvVOuvX+SM43roJ3mD+HXVESDbt9Ju4EkH1gQt
 y6oyKB98GwngsyUc9w73MUx8V+g/PymDHf1iwpTZrEJ0/apZRl2ftrBRPw+B3zB3Q3OEt3MXGFU
 mQfrDNBKU5eFlK2VdJm3uMZJBi+VQBlory2tQl62WLAhypLG8547pq9AnPla4S0zWDescoiYCGl
 WBYGR7TeTFheiQ6XoHa3Gmz8TMIaE0VKylJ5dq0JrGpLFHMy5/9vyFdOoSVEqtkg==
X-Google-Smtp-Source: AGHT+IGZ0mxzWOtRI3rd3KcueGeAebVyU0dbceyTolyf30W623KDAD9U5TSvvfvmt1qC+AO1AImubQ==
X-Received: by 2002:a05:701b:251b:b0:11b:9386:a381 with SMTP id
 a92af1059eb24-11f34c4acc2mr7533177c88.48.1765865457908; 
 Mon, 15 Dec 2025 22:10:57 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:ac28:4c61:4797:3d5])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11f2e30497fsm51603301c88.15.2025.12.15.22.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 22:10:57 -0800 (PST)
Date: Mon, 15 Dec 2025 22:10:54 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Message-ID: <n2fcsz4gl7lyniy2qxdddvrisguc4ssln4buky4g37rjnwxxo6@4lyarw5ngtqs>
References: <20251215-fts-fixes-v1-0-8c1e3a63ebf1@ixit.cz>
 <20251215-fts-fixes-v1-1-8c1e3a63ebf1@ixit.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251215-fts-fixes-v1-1-8c1e3a63ebf1@ixit.cz>
Cc: Rob Herring <robh@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-kernel@vger.kernel.org, Petr Hodina <petr.hodina@protonmail.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Andi Shyti <andi@etezian.org>, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/4] Input: stmfts - correct wording for
 the warning message
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

On Mon, Dec 15, 2025 at 03:30:01PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> We're trying to enable regulator, not disable it.
> 
> Fixes: 78bcac7b2ae1 ("Input: add support for the STMicroelectronics FingerTip touchscreen")
> Suggested-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Applied, thank you.

-- 
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
