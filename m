Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6EAB5E4E
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Sep 2019 09:53:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7834C35E02;
	Wed, 18 Sep 2019 07:53:22 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C7A2C35E02
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Sep 2019 07:53:20 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id m29so3531781pgc.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Sep 2019 00:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xjl+nKMauFdQMucZCGYFJNYkEcd8nmtmKLzonD2DvBw=;
 b=aapYiITKELPyW4PHB8mGw+Qj50qIrsMGCgbf6vimpLFQn0kfedpldxpF+mnmGruaRd
 0D8dSrIxudPaQYKYtAJrGcKiT8MvXUOpimKbMaeDoAoX0MlxNUIblfM+rFIUdA6Fa+q0
 fthHylYRRRyzedpTzlaznmGMzytzDacZRuJ/ge1XH/9Y1p4sdx40bnlddoJYjB64oksE
 a8XW5eydVr6oBq2MGac+QDMkHOFsmbDn+Te32g8A+A2ELQedhj4qMBs4oKMkLNMEpd6A
 RdoZHCGo7QdWuRXFOQApsNZa6kL3Mi5LyXDjTJeM7rmc077HB3Z/t+V2mQBDbDe3Dl70
 3Zbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xjl+nKMauFdQMucZCGYFJNYkEcd8nmtmKLzonD2DvBw=;
 b=OQVRe8zRqgSSgcTjtTCUMuY1LNvtsBbA+zqLa70j+dVdUO2TELNfzoUSNVzfxx1h/z
 bVbuWewlQvALuSD7a6uhDj0GJ+dHcVreKCWg+awu+hFpsRyeimif53mLoRqXxkJ8Eg/m
 NnflRvd4tuNlz0H8WX+Pb5J2qnmf++WCm78rBqEZkaIrtkCwzu6B18sRld2mbasmB8t8
 2SFnaGBrCCduWlGLMN38DUkkukcCKF5STkbqL5di2Mthv9zTocBs1XAkq333/eELvI9D
 Hxa+fMJ8CD3jv61GoBCCDrubY2kXISqVzc+C3c16lUJgo3OQinVwpekSFqw/2m/Md9aj
 TkCg==
X-Gm-Message-State: APjAAAUcIkT5V7iBr9x5IFcSKFHkX5hXmfMnWZIQdtaRBr18MtMo+0Qu
 cQHiab+QmkukEzRxlit3hPk=
X-Google-Smtp-Source: APXvYqy5KsztavGnDkcRDa8efg7SqNcEzpfdR8ZQEEx9n/F421fNVbt98mZe0yTO939Qqb5PhBhnRw==
X-Received: by 2002:a17:90a:2ecb:: with SMTP id
 h11mr2331197pjs.108.1568793198781; 
 Wed, 18 Sep 2019 00:53:18 -0700 (PDT)
Received: from localhost.localdomain ([2001:268:c147:d9df:f819:e399:825f:f2dc])
 by smtp.gmail.com with ESMTPSA id h8sm5580715pfo.64.2019.09.18.00.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 00:53:17 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@jic23.retrosnub.co.uk
Date: Wed, 18 Sep 2019 16:52:42 +0900
Message-Id: <f7969048e5db977cc6cc9daa8d32b170cf9f4c17.1568792697.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1568792697.git.vilhelm.gray@gmail.com>
References: <cover.1568792697.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 linux-kernel@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/7] counter: Simplify the count_read and
	count_write callbacks
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

The count_read and count_write callbacks are simplified to pass val as
unsigned long rather than as an opaque data structure. The opaque
counter_count_read_value and counter_count_write_value structures,
counter_count_value_type enum, and relevant counter_count_read_value_set
and counter_count_write_value_get functions, are removed as they are no
longer used.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/counter.c | 66 +++++----------------------------------
 include/linux/counter.h   | 43 +++----------------------
 2 files changed, 12 insertions(+), 97 deletions(-)

diff --git a/drivers/counter/counter.c b/drivers/counter/counter.c
index 106bc7180cd8..1d08f1437b1b 100644
--- a/drivers/counter/counter.c
+++ b/drivers/counter/counter.c
@@ -246,60 +246,6 @@ void counter_signal_read_value_set(struct counter_signal_read_value *const val,
 }
 EXPORT_SYMBOL_GPL(counter_signal_read_value_set);
 
-/**
- * counter_count_read_value_set - set counter_count_read_value data
- * @val:	counter_count_read_value structure to set
- * @type:	property Count data represents
- * @data:	Count data
- *
- * This function sets an opaque counter_count_read_value structure with the
- * provided Count data.
- */
-void counter_count_read_value_set(struct counter_count_read_value *const val,
-				  const enum counter_count_value_type type,
-				  void *const data)
-{
-	switch (type) {
-	case COUNTER_COUNT_POSITION:
-		val->len = sprintf(val->buf, "%lu\n", *(unsigned long *)data);
-		break;
-	default:
-		val->len = 0;
-	}
-}
-EXPORT_SYMBOL_GPL(counter_count_read_value_set);
-
-/**
- * counter_count_write_value_get - get counter_count_write_value data
- * @data:	Count data
- * @type:	property Count data represents
- * @val:	counter_count_write_value structure containing data
- *
- * This function extracts Count data from the provided opaque
- * counter_count_write_value structure and stores it at the address provided by
- * @data.
- *
- * RETURNS:
- * 0 on success, negative error number on failure.
- */
-int counter_count_write_value_get(void *const data,
-				  const enum counter_count_value_type type,
-				  const struct counter_count_write_value *const val)
-{
-	int err;
-
-	switch (type) {
-	case COUNTER_COUNT_POSITION:
-		err = kstrtoul(val->buf, 0, data);
-		if (err)
-			return err;
-		break;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(counter_count_write_value_get);
-
 struct counter_attr_parm {
 	struct counter_device_attr_group *group;
 	const char *prefix;
@@ -788,13 +734,13 @@ static ssize_t counter_count_show(struct device *dev,
 	const struct counter_count_unit *const component = devattr->component;
 	struct counter_count *const count = component->count;
 	int err;
-	struct counter_count_read_value val = { .buf = buf };
+	unsigned long val;
 
 	err = counter->ops->count_read(counter, count, &val);
 	if (err)
 		return err;
 
-	return val.len;
+	return sprintf(buf, "%lu\n", val);
 }
 
 static ssize_t counter_count_store(struct device *dev,
@@ -806,9 +752,13 @@ static ssize_t counter_count_store(struct device *dev,
 	const struct counter_count_unit *const component = devattr->component;
 	struct counter_count *const count = component->count;
 	int err;
-	struct counter_count_write_value val = { .buf = buf };
+	unsigned long val;
+
+	err = kstrtoul(buf, 0, &val);
+	if (err)
+		return err;
 
-	err = counter->ops->count_write(counter, count, &val);
+	err = counter->ops->count_write(counter, count, val);
 	if (err)
 		return err;
 
diff --git a/include/linux/counter.h b/include/linux/counter.h
index a061cdcdef7c..7e40796598a6 100644
--- a/include/linux/counter.h
+++ b/include/linux/counter.h
@@ -300,24 +300,6 @@ struct counter_signal_read_value {
 	size_t len;
 };
 
-/**
- * struct counter_count_read_value - Opaque Count read value
- * @buf:	string representation of Count read value
- * @len:	length of string in @buf
- */
-struct counter_count_read_value {
-	char *buf;
-	size_t len;
-};
-
-/**
- * struct counter_count_write_value - Opaque Count write value
- * @buf:	string representation of Count write value
- */
-struct counter_count_write_value {
-	const char *buf;
-};
-
 /**
  * struct counter_ops - Callbacks from driver
  * @signal_read:	optional read callback for Signal attribute. The read
@@ -328,15 +310,10 @@ struct counter_count_write_value {
  *			signal_read callback.
  * @count_read:		optional read callback for Count attribute. The read
  *			value of the respective Count should be passed back via
- *			the val parameter. val points to an opaque type which
- *			should be set only by calling the
- *			counter_count_read_value_set function from within the
- *			count_read callback.
+ *			the val parameter.
  * @count_write:	optional write callback for Count attribute. The write
  *			value for the respective Count is passed in via the val
- *			parameter. val points to an opaque type which should be
- *			accessed only by calling the
- *			counter_count_write_value_get function.
+ *			parameter.
  * @function_get:	function to get the current count function mode. Returns
  *			0 on success and negative error code on error. The index
  *			of the respective Count's returned function mode should
@@ -357,11 +334,9 @@ struct counter_ops {
 			   struct counter_signal *signal,
 			   struct counter_signal_read_value *val);
 	int (*count_read)(struct counter_device *counter,
-			  struct counter_count *count,
-			  struct counter_count_read_value *val);
+			  struct counter_count *count, unsigned long *val);
 	int (*count_write)(struct counter_device *counter,
-			   struct counter_count *count,
-			   struct counter_count_write_value *val);
+			   struct counter_count *count, unsigned long val);
 	int (*function_get)(struct counter_device *counter,
 			    struct counter_count *count, size_t *function);
 	int (*function_set)(struct counter_device *counter,
@@ -486,19 +461,9 @@ enum counter_signal_value_type {
 	COUNTER_SIGNAL_LEVEL = 0
 };
 
-enum counter_count_value_type {
-	COUNTER_COUNT_POSITION = 0,
-};
-
 void counter_signal_read_value_set(struct counter_signal_read_value *const val,
 				   const enum counter_signal_value_type type,
 				   void *const data);
-void counter_count_read_value_set(struct counter_count_read_value *const val,
-				  const enum counter_count_value_type type,
-				  void *const data);
-int counter_count_write_value_get(void *const data,
-				  const enum counter_count_value_type type,
-				  const struct counter_count_write_value *const val);
 
 int counter_register(struct counter_device *const counter);
 void counter_unregister(struct counter_device *const counter);
-- 
2.23.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
