Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 947FB82DE90
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jan 2024 18:39:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CAC1C6B457;
	Mon, 15 Jan 2024 17:39:41 +0000 (UTC)
Received: from mail.tbssa.com.br (mail.tbssa.com.br [179.127.80.113])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90AA7C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jan 2024 13:28:37 +0000 (UTC)
Received: by tubsanea-netservices (Postfix, from userid 106)
 id 1896EA254C; Mon, 15 Jan 2024 10:28:01 -0300 (-03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tbssa.com.br; s=mail;
 t=1705325281; bh=sHBPb8N1lZIHk9syHw/c3A6MNHtpG++Tq2m9T0ynZE4=;
 h=Subject:To:From:Date:Reply-To:From;
 b=KMOSIBDeSVLjVzFSZfWIk344PmPL44Df1qI/D9rN7UJ7vjKdARFvPtb7kj5g8kMSY
 oHfHbui7kDR1Oc3BiccLwzkkgDIJwp73IDRdNjKV5g1rE7Og6+0mJzUoR7JvJPrdiW
 WmmKDTjvw28VRTjexEB1fR++51Wlrzg8ShKmIUetpLDfa0JxdqyJCSnb9IYsSJGXCG
 /qLW1CXbGEX7fWGm0wu14voEWlQXVyO2CAEkw8cgHyh4PXKZY3vy8RRyqaKbt4aOp6
 TpMcB57RFs+L+CMYQvxJby01GIpvgS2uhtknzY29Yxqqq4SGUcnQKzF6MHyX0xQGu0
 jM/Zk/Q/gqvsQ==
Received: from zimbra.tbssa.com.br (unknown [192.168.190.7])
 by tubsanea-netservices (Postfix) with ESMTP id DA240A11D7;
 Mon, 15 Jan 2024 10:18:38 -0300 (-03)
Received: from localhost (localhost [127.0.0.1])
 by zimbra.tbssa.com.br (Postfix) with ESMTP id 15B4B144D7E93;
 Sun, 14 Jan 2024 15:01:01 -0300 (-03)
Received: from zimbra.tbssa.com.br ([127.0.0.1])
 by localhost (zimbra.tbssa.com.br [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id vrjObNZZLHz4; Sun, 14 Jan 2024 15:01:01 -0300 (-03)
Received: from localhost (localhost [127.0.0.1])
 by zimbra.tbssa.com.br (Postfix) with ESMTP id AFB4D144D7EBB;
 Sun, 14 Jan 2024 14:56:59 -0300 (-03)
X-Virus-Scanned: amavisd-new at tbssa.com.br
Received: from zimbra.tbssa.com.br ([127.0.0.1])
 by localhost (zimbra.tbssa.com.br [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Daw5UWXa1cqk; Sun, 14 Jan 2024 14:56:59 -0300 (-03)
Received: from [192.168.1.42] (unknown [177.54.157.16])
 by zimbra.tbssa.com.br (Postfix) with ESMTPSA id BCDD6145A1E87;
 Sun, 14 Jan 2024 14:53:20 -0300 (-03)
MIME-Version: 1.0
To: Recipients <elizandro.ferreira@tbssa.com.br>
From: BILL GATES DONATION<elizandro.ferreira@tbssa.com.br>
Date: Sun, 14 Jan 2024 20:53:10 +0300
Message-Id: <20240114175321.BCDD6145A1E87@zimbra.tbssa.com.br>
X-Spam-Result:  - ARC_NA[0.00]: ARC signature absent
 - FORGED_RECIPIENTS[2.00]: Recipients are not the same as RCPT TO: mail command; elizandro.ferreira@tbssa.com.br; linuxinit@gmail.com ...
 - FREEMAIL_ENVRCPT[0.00]: Envelope Recipient is a Freemail address; gmail.com; linuxmail.org
 - FREEMAIL_REPLYTO[0.00]: Reply-To is a Freemail address; outlook.com
 - FROM_EQ_ENVFROM[0.00]: From address is the same as the envelope
 - FROM_HAS_DN[0.00]: From header has a display name
 - HAS_REPLYTO[0.00]: Has Reply-To header; foundation36@outlook.com
 - LOCAL_DOMAINS[0.00]: tbssa.com.br
 - MIME_GOOD[-0.10]: Known content-type; multipart/alternative; text/plain
 - MIME_TRACE[0.00]: 0:+; 1:+; 2:~
 - RCPT_COUNT_ONE[0.00]: One recipient; 1
 - RCVD_COUNT_FIVE[0.00]: Message has 5-7 Received headers; 6
 - RCVD_NO_TLS_LAST[0.10]: Last hop did not use encrypted transports
 - RCVD_VIA_SMTP_AUTH[0.00]: Authenticated hand-off was seen in Received headers
 - REPLYTO_DOM_NEQ_FROM_DOM[0.00]: Reply-To domain does not match the From domain
 - RULES_SENDER_DOMAIN_R0001_1[0.00]: [CUSTOM_RULES_R0001] ; tbssa.com.br
 - R_NO_SPACE_IN_FROM[1.00]: No space in from header
 - TO_DN_ALL[0.00]: All the recipients have display names
 - TO_DN_RECIPIENTS[2.00]: To header display name is \"Recipients\"
 - TO_EQ_FROM[0.00]: To address matches the From address
 - TRUSTED_NETWORK[-30.00]: Endereço IP de origem faz parte das redes confiáveis; 192.168.190.7
X-Spam-Flag: NO
X-Spam-Scanner: OSTEC Anti-Spam on tubsanea-netservices
X-Spam-Scan-Time: 0.376 seconds
X-Spam-Scores: -25.0 / 2.7
X-Mailman-Approved-At: Mon, 15 Jan 2024 17:39:40 +0000
Subject: [Linux-stm32] Good day
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
Reply-To: foundation36@outlook.com
Content-Type: multipart/mixed; boundary="===============6628973206752526795=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

You will not see this in a MIME-aware mail reader.
--===============6628973206752526795==
Content-Type: multipart/alternative; boundary="===============1224253348=="

You will not see this in a MIME-aware mail reader.
--===============1224253348==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body

Greetings to you, you have been Donated ($5,000,000.00 USD) CONTACT WIH YOU=
R DETAILS Your full names................. Your contact address............=
.... Your personal telephone number............... SEND YOUR ABOVE DETAILS =
TO my Email: foundation36@outlook.com Remain Blessed Regards Bill Gates Fou=
ndation.
--===============1224253348==
Content-Type: text/html; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Diso-8859-1"/></head>Greetings to you, you have been Donated ($5,000,000.=
00 USD)
CONTACT WIH YOUR DETAILS
Your full names.................
Your contact address................
Your personal telephone number...............
SEND YOUR ABOVE DETAILS TO my Email: foundation36@outlook.com
Remain Blessed
Regards
Bill Gates Foundation.</html>
--===============1224253348==--

--===============6628973206752526795==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6628973206752526795==--
