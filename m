Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B3CCC1111
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Dec 2025 07:11:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8394C87EDC;
	Tue, 16 Dec 2025 06:11:42 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03436C87EDB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Dec 2025 06:11:42 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-c06cb8004e8so3582616a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 22:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765865500; x=1766470300;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=91/sEp6nL7Uz62wNdS3TngXU6hAiNIHZp0YMqKGfo9A=;
 b=hGvvxeapH1nNklYEp0HAMZUu7aaKLdIxsSJBYCWfJ/5n8VoM8Lq9aVLr2g4bXVtsIm
 CvoUCZsjtshEIFwaSpakiv8BgYTiF6E66AIPZ9dVD7FmfHp0GqLlyo2cYXeoAykcOH6E
 624n934r9l3GUZ5xZ1PtTl9I3c3xJrCpxYyYrtESFmyIbzyuYMzFXLGioOCc0vo2Nosi
 2yCZL4I4U1fQrSZ8MrAcQr/TAI+LvgD8VmfG1+CUqd4Odyg6wK+sXlEr6pqNM+f9wIqb
 rX+Em2szLqd2I0ni0CO0/4Uj3lm5XzuQNIOxwF+Blsk17FmfWnRSzPpZyXkLaSGF7coP
 i9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765865500; x=1766470300;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=91/sEp6nL7Uz62wNdS3TngXU6hAiNIHZp0YMqKGfo9A=;
 b=jbR8a8zERUFDPRUqoti1lybG9KhTH+haVDDaQmShg1ReepbfW4HSkelHrnlBUMLBW3
 N0TU2tGN34Y171YDl9xUyZFsULT696bJeYsmwYMy3B2LRM5B77/0XsbZQ93Db6LLXCjs
 yX1wFx/sarXyCcYVLg+iE+J/cxnukHbgvYe/8xFQaZ8iQxWh8lytLDMtB0G6oigRtg/1
 GOWkrD8rOORGpWtSGDuKcSE+LLncLgXQj2HfWqli3wadyErAbHzfaWZXqfeqEnwMtsN8
 XX6Fi2qd6OsbrSAucQcM6ckZd4KVhbYlBUm9pZOjw2oyI7+RRkVw0qUOuqzdqIOp5Zqu
 hl/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgp/FDtvpJYExpC3AzPspym4/w1+nYl1TUIV1YKqJ3P5A5dyedsphDzbnnfH2vIs2LCiA7KiF7aG3N+g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzlYanTSugMDVRS6/Pp365AuRDwsZ7qYk7qXWdXuyZpkwOqeDfM
 sjS2XJcKqlYMgBda9NZscU1JYL+8HJm+UhqkVxDyxevKCyq4M/tSMoLW
X-Gm-Gg: AY/fxX7Dw6BGbMuFNLrbFCUzcg8aMO3PKqWi99VQ4nNBL4q0ybfdoiSLurJIiRiTby+
 o1QtWhu7SE0IKPmEQ1th4va+wRIDfTN2fblsPpJmwiba44/bWuWkn+l8th5lzpUaH5kFRQE5bZW
 rjz376y2DQORLuFsJoA3Uz3j3JVbievweB1TnIMsfK+CJWuj3Ct2MYMDRGcQIgvelWRtlmjfFgj
 qrsHmjeHqMs3BKiM86rKSCy7XI9rQpO7LQ9jVg5zq2Zmc7QP7/3Z/sKqQ6sReA5ktTieLTQqzwo
 Gv8Pp8TNGc5eIPxlYfq8dYe21peknwVrhmXoWXkzg0altCVZOcBBYfOdfuzpQJtee9TnLmWvLDd
 lFEP3ww89vgHodkS12wkF4l+CQsRLzBBLVUAdCATsL+VqZ7f6Y7Z9v5o7Gno8XWA6KV/LBNcDcD
 sAhlW9bDk2nkS2Hd3QyZ7lX2IEcAG/Zl/tjylIn0tqUZnfR6ZTd0k=
X-Google-Smtp-Source: AGHT+IGrfQdHLxRSdxWY8bxHyCEpt6bqyxrt6EqKW0CWWGAPI8Y3i9jlvILhbFtYKANvT+tUPM/qAA==
X-Received: by 2002:a05:7300:f78e:b0:2ac:1bb1:68d4 with SMTP id
 5a478bee46e88-2ac2f85ee02mr8946330eec.7.1765865500306; 
 Mon, 15 Dec 2025 22:11:40 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:ac28:4c61:4797:3d5])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2ae4f0546b8sm502879eec.31.2025.12.15.22.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 22:11:39 -0800 (PST)
Date: Mon, 15 Dec 2025 22:11:37 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Message-ID: <gjnxidvenisbv4lib4jhngybjqcux2umn2iunnaqvjct764njg@qf2k7mcvebml>
References: <20251215-fts-fixes-v1-0-8c1e3a63ebf1@ixit.cz>
 <20251215-fts-fixes-v1-3-8c1e3a63ebf1@ixit.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251215-fts-fixes-v1-3-8c1e3a63ebf1@ixit.cz>
Cc: Rob Herring <robh@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-kernel@vger.kernel.org, Petr Hodina <petr.hodina@protonmail.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Andi Shyti <andi@etezian.org>, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/4] Input: stmfts - use sysfs_emit()
	instead of sprintf()
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

On Mon, Dec 15, 2025 at 03:30:03PM +0100, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Follow the advice in Documentation/filesystems/sysfs.rst:
> show() should only use sysfs_emit() or sysfs_emit_at() when formatting
> the value to be returned to user space.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Applied, thank you.

-- 
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
